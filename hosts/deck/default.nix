{ inputs, ... } : {
  imports = [
    ../../common-configuration.nix
    ./hardware-configuration.nix

    ./plasma-desktop.nix
    ./cameras.nix
    ./kdeconnect.nix
    ./easyeffects.nix
  ];

  home-manager.sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
  home-manager.users.npbarnes = import ./home.nix;

  networking.hostName = "deck";
  system.stateVersion = "25.05";
}
