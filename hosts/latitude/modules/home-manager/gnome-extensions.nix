{ pkgs, ... }:
{
  my.gnome.extensionPkgs = [
    pkgs.gnomeExtensions.power-off-options
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.caffeine
    pkgs.gnomeExtensions.just-perfection
  ];

  dconf.settings = {
    "org/gnome/shell/extensions/power-off-options" = {
      show-hibernate = true;
      show-suspend-then-hibernate = true;
      show-settings = false;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      quick-settings-night-light = false;
      quick-settings-dark-mode = false;
      support-notifier-type = 0;
    };
  };
}
