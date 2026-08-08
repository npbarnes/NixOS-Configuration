{ config, lib, ... } :
{
  # This option is needed so that dconf settings get merged
  options.my.gnome.extensions = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [];
    description = "List of GNOME Extension UUIDs to enable";
  };

  config = {
    dconf.settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = config.my.gnome.extensions;
    };
  };
}
