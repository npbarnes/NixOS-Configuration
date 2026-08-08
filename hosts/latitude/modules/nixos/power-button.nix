{
  # Use systemd to suspend then hibernate when the power button is pressed
  services.logind.settings.Login = {
    HandlePowerKey = "suspend-then-hibernate";
    HibernateDelaySec = "2h";
  };

  # Block GNOME from taking control of the power button
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.login1.inhibit-handle-power-key") {
        return polkit.Result.NO;
      }
    });
  '';

  # Tell GNOME's internal settings to ignore the button
  services.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.settings-daemon.plugins.power]
    power-button-action='nothing'
  '';
}
