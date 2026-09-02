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
    wget
    htop
    tree
    curl
    git
    ripgrep
    wl-clipboard # Allows neovim to use the system clipboard (Wayland)
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  services.fwupd.enable = true;
}
