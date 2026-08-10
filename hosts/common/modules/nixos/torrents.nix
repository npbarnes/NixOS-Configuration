{ pkgs, ... }: {
  services.qbittorrent = {
    enable = true;
    serverConfig.BitTorrent.Session = {
      Interface = "wgivpn";
      InterfaceName = "wqivpn";
    };
  };
}
