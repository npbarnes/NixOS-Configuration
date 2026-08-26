{ pkgs, inputs, ... }: {
  imports = [
    inputs.jovian.nixosModules.default
  ];

  environment.systemPackages = [
    pkgs.steamdeck-firmware
    pkgs.jupiter-dock-updater-bin
  ];

  # Enable Steam Deck specific patches
  jovian.devices.steamdeck.enable = true;

  # Do NOT enable the Steam Deck console-like experience
  jovian.steam.enable = false;
  jovian.steam.autoStart = false;
}
