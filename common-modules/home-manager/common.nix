{ config, pkgs, ... }:
{
  home.username = "npbarnes";
  home.homeDirectory = "/home/npbarnes";

  home.packages = [
    pkgs.texlive.combined.scheme-full
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

  home.file = let
    configDir = "${config.home.homeDirectory}/NixOS-Configuration"; # assumed location of configuration repo
  in
  {
    ".bashrc".source = config.lib.file.mkOutOfStoreSymlink
      "${configDir}/common-dotfiles/bashrc";
    ".vimrc".source = config.lib.file.mkOutOfStoreSymlink
      "${configDir}/common-dotfiles/vimrc";

    ".config/VSCodium/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink
      "${configDir}/common-dotfiles/VSCodium/settings.json";

    # SSH config
    ".ssh/config".source = config.lib.file.mkOutOfStoreSymlink
      "${configDir}/common-dotfiles/ssh/config";
  };

  home.sessionVariables = { };

  services.ssh-agent.enable = true;

  programs.home-manager.enable = true;
}
