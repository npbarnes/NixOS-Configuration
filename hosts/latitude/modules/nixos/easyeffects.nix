{ inputs, ... }: {
  programs.dconf.enable = true;

  home-manager.users.npbarnes = {
    services.easyeffects = {
      enable = true;
      extraPresets = {
        advanced-auto-gain = builtins.fromJSON (builtins.readFile (inputs.easyeffects-presets + "/Advanced Auto Gain.json"));
      };
      preset = "advanced-auto-gain";
    };
  };
}
