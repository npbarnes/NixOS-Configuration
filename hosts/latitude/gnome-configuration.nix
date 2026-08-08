{ pkgs, ... } : let
  gnomeExtensionsList = [
    pkgs.gnomeExtensions.power-off-options
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.gsconnect
    pkgs.gnomeExtensions.caffeine
  ];
in {
  home.packages = gnomeExtensionsList;

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = map (ext: ext.extensionUuid) gnomeExtensionsList;
    };
  };
}
