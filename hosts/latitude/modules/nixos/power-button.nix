{
  services.logind.settings.Login = {
    # Suspend then hibernate when the power button is pressed
    HandlePowerKey = "suspend-then-hibernate";
    HibernateDelaySec = "2h";
  };
}
