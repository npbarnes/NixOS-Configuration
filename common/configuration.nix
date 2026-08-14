{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    htop
    tree
    curl
    git
    ripgrep
  ];

  services.flatpak.enable = true;
  hardware.steam-hardware.enable = true; # Not just for Steam Deck, enables controllers.

  environment.variables.EDITOR = "vim";
}
