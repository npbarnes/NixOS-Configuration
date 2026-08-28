{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0"; # Check for latest!
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      listFilesRecursiveIfExists =
        path:
        if builtins.pathExists path then inputs.nixpkgs.lib.filesystem.listFilesRecursive path else [ ];

      buildConfigs =
        hostsList:
        inputs.nixpkgs.lib.listToAttrs (
          map (
            hostPath:
            let
              hostname = baseNameOf hostPath;
              importNixosModules = path: {
                imports = listFilesRecursiveIfExists (path + "/modules/nixos");
              };
              importHomeModules = path: {
                home-manager.users.npbarnes.imports = listFilesRecursiveIfExists (path + "/modules/home-manager");
              };
              _importDotfiles = path: { myUtils, ... }: {
                home.file = myUtils.dirToHomeFileAttrOutOfStoreIfExists (path + "/dotfiles");
              };
              importDotfiles = path: {
                home-manager.users.npbarnes.imports = [ (_importDotfiles path) ];
              };
            in
            {
              name = hostname;
              value = inputs.nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                  { networking.hostName = hostname; }
                  (hostPath + "/hardware-configuration.nix")
                  {
                    users.users.npbarnes = {
                      isNormalUser = true;
                      description = "Nathan Barnes";
                      extraGroups = [
                        "networkmanager"
                        "wheel"
                      ];
                    };
                  }
                  inputs.home-manager.nixosModules.home-manager
                  {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.backupFileExtension = "backup";
                  }
                  ./utils
                  ./common/configuration.nix
                  (importNixosModules ./common)
                  (importHomeModules ./common)
                  (importDotfiles ./common)
                  (importNixosModules hostPath)
                  (importHomeModules hostPath)
                  (importDotfiles hostPath)
                  (hostPath + "/configuration.nix")
                ];
              };
            }
          ) hostsList
        );
      getSubdirs =
        dir:
        let
          entries = builtins.readDir dir;
          entryNames = builtins.attrNames entries;
          nonDirs = builtins.filter (name: entries.${name} != "directory") entryNames;
        in
        if nonDirs != [ ] then
          builtins.throw "Host path '${toString dir}' contains non-directory entries: ${builtins.concatStringsSep ", " nonDirs}"
        else
          map (name: dir + "/${name}") entryNames;
    in
    {
      nixosConfigurations = buildConfigs (getSubdirs ./hosts);
    };
}
