{
  programs.gnome-terminal = {
    enable = true;
    profile."27a967ce-38c1-40c3-a6ca-37038ca7be40" = {
      visibleName = "Default";
      default = true;
      customCommand = "fish";
      audibleBell = false;
      scrollbackLines = 1000000;
      allowBold = true;
      boldIsBright = true;
      colors = {
        # Gnome Dark theme with Gnome color palette
        foregroundColor = "rgb(208,207,204)";
        backgroundColor = "rgb(23,20,33)";
        palette = [
          "rgb(23,20,33)"
          "rgb(192,28,40)"
          "rgb(38,162,105)"
          "rgb(162,115,76)"
          "rgb(18,72,139)"
          "rgb(163,71,186)"
          "rgb(42,161,179)"
          "rgb(208,207,204)"
          "rgb(94,92,100)"
          "rgb(246,97,81)"
          "rgb(51,209,122)"
          "rgb(233,173,12)"
          "rgb(42,123,222)"
          "rgb(192,97,203)"
          "rgb(51,199,222)"
          "rgb(255,255,255)"
        ];
      };
    };
  };
}
