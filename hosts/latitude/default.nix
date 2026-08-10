{ lib, inputs, ... } : {
  imports = [
    ./hardware-configuration.nix
    inputs.nix-hardware.nixosModules.dell-latitude-7430
    ../common
  ]
  ++ (lib.filesystem.listFilesRecursive ./modules/nixos)
  ++ [{
    home-manager.users.npbarnes.imports = lib.filesystem.listFilesRecursive ./modules/home-manager;
  }];

  networking.hostName = "latitude";

  system.stateVersion = "26.05";
  home-manager.users.npbarnes.home.stateVersion = "26.05";
}
