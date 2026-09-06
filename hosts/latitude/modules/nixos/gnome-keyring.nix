{ lib, ... }: {
  services.gnome.gnome-keyring.enable = true;

  # Use Gnome Keyring as the ssh agent
  programs.ssh.startAgent = lib.mkForce false;
  home-manager.users.npbarnes = {
    services.ssh-agent.enable = lib.mkForce false;
  };
}
