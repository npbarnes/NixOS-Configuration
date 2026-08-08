{pkgs, ...} : {
  services.ivpn.enable = true;
  environment.systemPackages = [ pkgs.ivpn-ui ];

  systemd.services.ivpn-autoconnect = {
    description = "IVPN autoconnect service";
    requires = [ "network-online.target" "ivpn-service.service" ];
    after = [ "network-online.target" "ivpn-service.service" ];
    wantedBy = [ "multi-user.target" ];

    path = [ pkgs.ivpn ];

    serviceConfig = {
      Type = "oneshot";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
      ExecStop = "${pkgs.ivpn}/bin/ivpn disconnect";
      RemainAfterExit = true;
    };

    script = ''
      ivpn connect -any
    '';
  };
}
