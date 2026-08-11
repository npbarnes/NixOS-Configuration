{ config, lib, ... }:
{
  options.my.gnome = {
    extensionIds = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "List of GNOME extension UUIDs to enable (you must install the package separately)";
    };
    extensionPkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "List of GNOME extension packages to install and enable";
    };
  };

  config = {
    home.packages = config.my.gnome.extensionPkgs;

    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions =
          config.my.gnome.extensionIds ++ (map (ex: ex.extensionUuid) config.my.gnome.extensionPkgs);
      };
    };
  };
}
