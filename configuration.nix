# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/nixos/systemd.nix
    ./modules/nixos/bluetooth.nix
    ./modules/nixos/sound.nix
    ./modules/nixos/locale.nix
    ./modules/nixos/printing.nix
    ./modules/nixos/sudo.nix
    ./modules/nixos/plasma.nix
    ./modules/nixos/vpn.nix
    ./modules/nixos/distrobox.nix
    ./modules/nixos/steam.nix
    ./modules/nixos/nixstore-disk-usage.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;
  networking.hostName = "deck";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.npbarnes = {
    isNormalUser = true;
    description = "Nathan Barnes";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # Use Home Manager
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
  ];

  environment.variables.EDITOR = "vim";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}

