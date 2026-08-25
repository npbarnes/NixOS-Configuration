{ inputs, ... }: {
  imports = [
    inputs.jovian.nixosModules.default
  ];

  # Enable Steam Deck specific patches
  jovian.devices.steamdeck.enable = true;

  # Do NOT enable the Steam Deck console-like experience
  jovian.steam.enable = false;
  jovian.steam.autoStart = false;

  system.stateVersion = "25.05";
  home-manager.users.npbarnes.home.stateVersion = "24.11";
}
