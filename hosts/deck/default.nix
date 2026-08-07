{ inputs, ... } : {
  imports = [
    ../../common-configuration.nix
    ./hardware-configuration.nix

    ./plasma-desktop.nix
    ./kdeconnect.nix
    ./easyeffects.nix
  ];

  home-manager.sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
  home-manager.users.npbarnes = import ./home.nix;

  services.flatpak.enable = true;

  networking.hostName = "deck";
  system.stateVersion = "25.05";
}
