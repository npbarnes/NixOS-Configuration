{ pkgs, lib, ... }: {
  services.gnome.gnome-keyring.enable = lib.mkForce false;
  security.pam.services.sddm.kwallet.enable = lib.mkForce false;

  home-manager.users.npbarnes = {
    home.packages = [
      pkgs.keepassxc
    ];

    services.ssh-agent.enable = true;

    programs.firefox = {
      policies = {
        ExtensionSettings = {
          "keepassxc-browser@keepassxc.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi";
            installation_mode = "normal_installed";
            default_area = "navbar";
            private_browsing = true;
          };
        };
      };
    }; # end programs.firefox
  }; # end home-manager.users.npbarnes
}
