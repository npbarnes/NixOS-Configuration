{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, ... }@inputs: let
    my-home-manager-config = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "backup";
      home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
      home-manager.users.npbarnes = import ./home.nix;
    };
  in {
    nixosConfigurations = {
      deck = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./deck-hardware-configuration.nix
          ./configuration.nix
          ({networking.hostName = "deck";})
          ({
            # Do not change without reading the docs
            # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
            system.stateVersion = "25.05"; # Did you read the comment?
          })
          home-manager.nixosModules.home-manager
          my-home-manager-config
        ];
      };
      surface = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./surface-hardware-configuration.nix
          ./configuration.nix
          ({networking.hostName = "surface";})
          ({
            # Do not change without reading the docs
            # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
            system.stateVersion = "25.11"; # Did you read the comment?
          })
          home-manager.nixosModules.home-manager
          my-home-manager-config
        ];
      };
    };
  };
}
