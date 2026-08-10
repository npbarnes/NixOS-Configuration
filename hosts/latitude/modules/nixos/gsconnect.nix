{ pkgs, ... }: {
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  home-manager.users.npbarnes = {
    my.gnome.extensions = [
      pkgs.gnomeExtensions.gsconnect.extensionUuid
    ];
  };
}
