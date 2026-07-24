# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports = [
    ./modules/nixos/systemd.nix
    ./modules/nixos/bluetooth.nix
    ./modules/nixos/sound.nix
    ./modules/nixos/locale.nix
    ./modules/nixos/printing.nix
    ./modules/nixos/sudo.nix
    ./modules/nixos/plasma.nix
    ./modules/nixos/vpn.nix
    ./modules/nixos/distrobox.nix
    ./modules/nixos/gnomeboxes.nix
    ./modules/nixos/steam.nix
    ./modules/nixos/nh-clean.nix
    ./modules/nixos/nix-ld.nix
    ./modules/nixos/kdeconnect.nix
    ./modules/nixos/appimage.nix
    ./modules/nixos/torrents.nix
    ./modules/nixos/easyeffects.nix
    ./modules/nixos/cameras.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;

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
    htop
  ];

  services.flatpak.enable = true;

  environment.variables.EDITOR = "vim";
}

