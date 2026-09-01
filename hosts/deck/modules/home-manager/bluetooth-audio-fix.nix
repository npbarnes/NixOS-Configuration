{ pkgs, ... }: {
  systemd.user.services.restart-wireplumber = {
    Unit = {
      Description = "Restart WirePlumber after desktop initialization";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 5";
      ExecStart = "${pkgs.systemd}/bin/systemctl --user restart wireplumber.service";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}

