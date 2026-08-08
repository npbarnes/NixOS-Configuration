{ pkgs, ... } :
let
  extensionsList = [
    pkgs.gnomeExtensions.power-off-options
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.caffeine
  ];
in
{
  home.packages = extensionsList;

  my.gnome.extensions = map (ext: ext.extensionUuid) extensionsList;
}

