{
  # Full disk encryption makes autoLogin secure
  services.displayManager.autoLogin = {
    enable = true;
    user = "npbarnes";
  };

  system.stateVersion = "26.05";
  home-manager.users.npbarnes.home.stateVersion = "26.05";
}
