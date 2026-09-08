{
  programs.gnome-terminal = {
    enable = true;
    profile."27a967ce-38c1-40c3-a6ca-37038ca7be40" = {
      visibleName = "Default";
      default = true;
      customCommand = "fish";
      allowBold = true;
      audibleBell = false;
      scrollbackLines = 1000000;
    };
  };
}
