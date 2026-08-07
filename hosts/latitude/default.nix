{ inputs, ... } : {
  imports = [
    ../../common-configuration.nix
    ./hardware-configuration.nix
    ./gnome-desktop.nix
  ];

  home-manager.users.npbarnes = import ./home.nix;

  networking.hostName = "latitude";
  system.stateVersion = "26.05";
}
