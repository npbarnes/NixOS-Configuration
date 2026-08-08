{
  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults timestamp_timeout=360
      Defaults pwfeedback
    '';
  };
}
