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
    neovim
    wl-clipboard # Allows neovim to use the system clipboard (Wayland)
    wget
    htop
    tree
    curl
    git
    ripgrep
  ];

  services.fwupd.enable = true;

  environment.variables.EDITOR = "nvim";
}
