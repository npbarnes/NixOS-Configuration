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

  environment.variables.EDITOR = "vim";
}
