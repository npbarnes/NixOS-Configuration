{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 14d --keep 5";
    };
    flake = "/home/npbarnes/NixOS-Configuration"; # sets NH_OS_FLAKE variable for you
  };
}
