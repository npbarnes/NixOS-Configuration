{ pkgs, ... }:
{
  my.gnome.extensionPkgs = [
    pkgs.gnomeExtensions.power-off-options
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.caffeine
  ];

  dconf.settings = {
    "org/gnome/shell/extensions/power-off-options" = {
      show-hibernate = true;
      show-suspend-then-hibernate = true;
      show-hybrid-sleep = true;
    };
  };
}
