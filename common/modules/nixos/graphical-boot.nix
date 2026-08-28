{
  boot = {
    plymouth.enable = true;

    initrd.systemd.enable = true;

    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "vt.global_cursor_default=0"
    ];
  };
}
