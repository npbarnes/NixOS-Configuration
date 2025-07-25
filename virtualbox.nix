{ lib, pkgs, ... }:
{
  # Enable VirtualBox Guest Additions
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.clipboard = true;

  # VirtualBox uses GRUB bootloader
  boot.loader.grub.enable = lib.mkForce true;
  boot.loader.grub.device = lib.mkForce "/dev/sda";
  boot.loader.grub.useOSProber = lib.mkForce true;

  # Disable the default bootloader
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = lib.mkForce false;
}
