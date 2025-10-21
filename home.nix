{ config, pkgs, ... }:
{
  home.username = "npbarnes";
  home.homeDirectory = "/home/npbarnes";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  imports = [
    ./modules/home-manager/plasma.nix
    ./modules/home-manager/firefox.nix
    ./modules/home-manager/git.nix
    ./modules/home-manager/vscode.nix
  ];

  home.packages = [
    pkgs.texlive.combined.scheme-full
    pkgs.texstudio
    pkgs.julia-bin
    pkgs.onlyoffice-bin
    pkgs.ivpn-ui # also needs services.ivpn.enable = true; in main NixOS configuration
    pkgs.heroic
  ];

  home.file = let
    configDir = "${config.home.homeDirectory}/NixOS-Configuration"; # assumed location of configuration repo
  in
  {
    ".bashrc".source = config.lib.file.mkOutOfStoreSymlink
      "${configDir}/dotfiles/bashrc";
    ".vimrc".source = config.lib.file.mkOutOfStoreSymlink
      "${configDir}/dotfiles/vimrc";

    ".config/VSCodium/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink
      "${configDir}/dotfiles/VSCodium/settings.json";

    # SSH config
    ".ssh/config".source = config.lib.file.mkOutOfStoreSymlink
      "${configDir}/dotfiles/ssh/config";
  };

  home.sessionVariables = { };

  services.ssh-agent.enable = true;

  programs.home-manager.enable = true;
}
