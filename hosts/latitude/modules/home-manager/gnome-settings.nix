{
  dconf.settings = {
    "org/gnome/Console" = {
      audible-bell = false;
      ignore-scrollback-limit = true;
    };
    "/org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "hibernate";
    };
    "/org/gnome/desktop/interface" = {
      show-battery-percentage = true;
    };
    "/org/gnome/desktop/screensaver" = {
      lock-delay = lib.hm.gvariant.mkUint32 300; # seconds
    };
    "/org/gnome/desktop/notifications" = {
      show-in-lock-screen = false;
    };
    "/org/gnome/desktop/privacy" = {
      recent-files-max-age = 7;
      remove-old-trash-files = true;
      remove-old-temp-files = true;
    };
  };
}
