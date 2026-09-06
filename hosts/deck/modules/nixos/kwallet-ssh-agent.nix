{ pkgs, ... }: {
  programs.ssh.startAgent = true;

  security.pam.services.sddm.enableKwallet = true;

  programs.ssh.askPassword = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
  envrionment.variables.SSH_ASKPASS_REQUIRE = "prefer";
}
