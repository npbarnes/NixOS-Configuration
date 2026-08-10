{ pkgs, ... }:
{
  services.gvfs.enable = true;

  environment.systemPackages = [
    pkgs.kdePackages.kio-extras
    pkgs.kdePackages.kamera
    pkgs.libgphoto2
  ];
}
