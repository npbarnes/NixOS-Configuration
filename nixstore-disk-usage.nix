{ lib, pkgs, ... }:
{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  nix.optimise.automatic = true;

  # Uncomment to optimise the store during every build (may slow down builds).
  #nix.settings.auto-optimise-store = true;

  # Uncomment to limit the number of configurations in the bootloader.
  #boot.loader.systemd-boot.configurationLimit = 10;
}
