{ pkgs, ... }: {
  services.flatpak.enable = true;

  # Automatic updates
  systemd.services.flatpak-system-update = {
    description = "Update system Flatpaks automatically";
    serviceConfig = {
      type = "oneshot";
      ExecStart = "${pkgs.flatpak}/bin/flatpak update -y";
    };
  };

  systemd.timers.flatpak-system-update = {
    description = "Timer to automatically update Flatpaks";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };

  home-manager.users.npbarnes = {
    systemd.user.services.flatpak-user-update = {
      Unit.Description = "Update user Flatpaks automatically";
      Service.Type = "oneshot";
      Service.ExecStart = "${pkgs.flatpak}/bin/flatpak update --user -y";
    };

    systemd.user.timers.flatpak-user-update = {
      Unit.Description = "Timer to automatically update user Flatpaks";
      Install.WantedBy = [ "timers.target" ];
      Timer = {
        OnCalendar = "daily";
        Persistent = true;
      };
    };
  };
}
