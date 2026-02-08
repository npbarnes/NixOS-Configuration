{pkgs, ...} : {
  # Activate IVPN service and install desktop UI.
  services.ivpn.enable = true;

  environment.systemPackages = [ pkgs.ivpn-ui ];
}
