{ inputs, ... } : {
  imports = [
    ../../common-configuration.nix
    ./hardware-configuration.nix
    ./gnome-desktop.nix
  ];

  home-manager.users.npbarnes = import ./home.nix;

  networking.firewall = {
    # GSConnect needs ports 1714 - 1764 open
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  };

  networking.hostName = "latitude";
  system.stateVersion = "26.05";
}
