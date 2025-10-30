{pkgs, ...} : {
  virtualisation = {
    libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true;
      };
    };

    spiceUSBRedirection.enable = true;
  };

  users.groups.libcirtd.members = [ "npbarnes" ];
  users.groups.kvm.members = [ "npbarnes" ];

  environment.systemPackages = [
    pkgs.gnome-boxes
    pkgs.dnsmasq
    pkgs.phodav
  ];

}
