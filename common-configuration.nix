# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./common-modules/nixos/systemd.nix
    ./common-modules/nixos/bluetooth.nix
    ./common-modules/nixos/sound.nix
    ./common-modules/nixos/locale.nix
    ./common-modules/nixos/printing.nix
    ./common-modules/nixos/sudo.nix
    ./common-modules/nixos/vpn.nix
    ./common-modules/nixos/distrobox.nix
    ./common-modules/nixos/gnomeboxes.nix
    ./common-modules/nixos/steam.nix
    ./common-modules/nixos/nh-clean.nix
    ./common-modules/nixos/nix-ld.nix
    ./common-modules/nixos/appimage.nix
    ./common-modules/nixos/torrents.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

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

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    htop
  ];

  environment.variables.EDITOR = "vim";
}

