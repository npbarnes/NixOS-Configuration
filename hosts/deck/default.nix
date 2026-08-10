{ lib, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common
  ]
  ++ (lib.filesystem.listFilesRecursive ./modules/nixos)
  ++ [
    {
      home-manager.users.npbarnes.imports = lib.filesystem.listFilesRecursive ./modules/home-manager ++ [
        ({ myUtils, ... }: { home.file = myUtils.dirToHomeFileAttrOutOfStore ./dotfiles; })
      ];
    }
  ];

  networking.hostName = "deck";
  system.stateVersion = "25.05";
  home-manager.users.npbarnes.home.stateVersion = "24.11";
}
