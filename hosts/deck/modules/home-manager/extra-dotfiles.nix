{ config, ... } :
{
  home.file = let
    configDir = "${config.home.homeDirectory}/NixOS-Configuration"; # assumed location of configuration repo
  in
  {
    ".local/share/kxmlgui5/dolphin/dolphinui.rc".source = config.lib.file.mkOutOfStoreSymlink
      "${configDir}/hosts/deck/dotfiles/local/share/kxmlgui5/dolphin/dolphinui.rc";
  };
}
