{ pkgs, ... }: let
  ksshaskpass = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
in {
  programs.ssh.startAgent = true;

  security.pam.services.sddm.enableKwallet = true;

  programs.ssh.enableAskPassword = true;
  programs.ssh.askPassword = ksshaskpass;
  environment.variables.SSH_ASKPASS_REQUIRE = "prefer";

  environment.systemPackages = [
    (pkgs.makeDesktopItem {
      name = "org.kde.ksshaskpass";
      desktopName = "KSSHAskPass";
      exec = ksshaskpass;
      icon = "dialog-password";
      comment = "Ssh-askpass UI for KDE";
      type = "Application";
      terminal = false;
      noDisplay = true;
    })
  ];
}
