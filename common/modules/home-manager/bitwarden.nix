{ pkgs, lib, ... }: {
  home.packages = [
    pkgs.bitwarden-desktop
  ];

  # Use Bitwarden SSH Agent
  services.ssh-agent.enable = lib.mkForce false;

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$HOME/.bitwarden-ssh-agent.sock";
  };
}
