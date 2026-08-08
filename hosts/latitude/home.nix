{ config, pkgs, ... } : {
  imports = [
    ../../common-home.nix
    ./gnome-configuration.nix
  ];

  home.stateVersion = "26.05";
}

