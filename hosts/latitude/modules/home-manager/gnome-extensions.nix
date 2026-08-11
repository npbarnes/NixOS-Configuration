{ pkgs, ... }:
{
  my.gnome.extensionPkgs = [
    pkgs.gnomeExtensions.power-off-options
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.caffeine
  ];
}
