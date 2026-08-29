{ config, pkgs, ... }:
{
  home.username = "npbarnes";
  home.homeDirectory = "/home/npbarnes";

  home.packages = [
    pkgs.texliveFull
    pkgs.texstudio
    pkgs.onlyoffice-desktopeditors
    pkgs.heroic
    pkgs.itch
    pkgs.brave
    pkgs.qdirstat
    pkgs.vlc
    pkgs.qbittorrent
    pkgs.discord
  ];

  home.sessionVariables = { };

  services.ssh-agent.enable = true;

  programs.home-manager.enable = true;
}
