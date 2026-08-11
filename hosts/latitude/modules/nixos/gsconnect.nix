{ pkgs, ... }: {
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  home-manager.users.npbarnes = {
    my.gnome.extensionIds = [
      pkgs.gnomeExtensions.gsconnect.extensionUuid
    ];
  };
}
