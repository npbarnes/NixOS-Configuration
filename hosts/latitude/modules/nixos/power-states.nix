{
  services.logind.settings.Login = {
    HandlePowerKey = "suspend-then-hibernate";
    HandleLidSwitch = "suspend-then-hibernate";
    HandleLidSwitchDocked = "ignore";
    HibernateDelaySec = "2h";
  };

  # Block GNOME from overriding systemd power state management
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.login1.inhibit-handle-power-key" ||
          action.id == "org.freedesktop.login1.inhibit-handle-lid-switch") {
        return polkit.Result.NO;
      }
    });
  '';

  # Tell GNOME's internal settings to ignore the power button
  services.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.settings-daemon.plugins.power]
    power-button-action='nothing'
  '';
}
