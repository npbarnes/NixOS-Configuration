{ pkgs, ...}: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      # Fix bugged prompt character https://github.com/IlanCosman/tide/issues/622
      set -gx tide_character_vi_icon_default "❯"

      # Remove Fish greeting
      set -U fish_greeting ""

      # Add local bin
      fish_add_path -g ~/.local/bin

      # Auto-ls on directory change
      function on_cd --on-variable PWD
        ls
      end

      # Distrobox
      if set -q CONTAINER_ID
        fish_add_path -g ~/.juliaup/bin
      end
    '';
  };

  # fzf, bat, and fd are required for fishPlugins.fzf-fish
  programs.fzf.enable = true;
  programs.bat.enable = true;

  home.packages = [
    pkgs.fd

    pkgs.fishPlugins.tide
    pkgs.fishPlugins.fzf-fish
    pkgs.fishPlugins.z
    pkgs.fishPlugins.autopair
  ];
}
