{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [ inputs.home-manager.nixosModules.home-manager ] ++
    (lib.filesystem.listFilesRecursive ./modules/nixos) ++
    [{
      home-manager.users.npbarnes.imports = lib.filesystem.listFilesRecursive ./modules/home-manager
      ++ [
        ./home-utils.nix
        ({ myUtils, ... } : { home.file = myUtils.dirToHomeFileAttrOutOfStore ./dotfiles; })
      ];
    }];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.npbarnes = {
    isNormalUser = true;
    description = "Nathan Barnes";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # Use Home Manager
    ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.extraSpecialArgs = { inherit inputs; }; # Required for home-utils.nix

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    htop
    tree
    curl
    git
  ];

  hardware.steam-hardware.enable = true; # Not just for Steam Deck, enables controllers.

  environment.variables.EDITOR = "vim";
}

