{ pkgs, ... }: {
  programs.ssh.startAgent = true;

  security.pam.services.sddm.enableKwallet = true;

  programs.ssh.enableAskPassword = true;
  programs.ssh.askPassword = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
  environment.variables.SSH_ASKPASS_REQUIRE = "prefer";
}
