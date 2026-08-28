{ pkgs, inputs, ... }: {
  imports = [
    inputs.jovian.nixosModules.default
  ];

  environment.systemPackages = [
    pkgs.steamdeck-firmware
    pkgs.jupiter-dock-updater-bin
  ];

  # Enable Steam Deck specific patches
  jovian.devices.steamdeck = {
    enable = true;
    autoUpdate = true; # Firmware updates
  };

  # Enable SteamOS specific settings
  jovian.steamos.useSteamOSConfig = true;

  # Enable the Steam Deck console-like experience
  jovian.steam.enable = true;

  # Do NOT boot directly into Steam (use `start-gamescope-session` command instead)
  jovian.steam.autoStart = false;
}
