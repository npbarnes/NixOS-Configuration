{pkgs, ...} : {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.enableUpdateCheck = true;
    profiles.default.enableExtensionUpdateCheck = true;
    profiles.default.extensions = [
      pkgs.vscode-marketplace.jnoortheen.nix-ide
      pkgs.vscode-marketplace.julialang.language-julia
      pkgs.vscode-marketplace.dnut.rewrap-revived
      pkgs.vscode-marketplace.streetsidesoftware.code-spell-checker
    ];
    profiles.python.extensions = [
      pkgs.vscode-marketplace.ms-python.python
      pkgs.vscode-marketplace.mkhl.direnv
    ];
  };

  home.packages = [
    pkgs.nixfmt
    pkgs.nixfmt-tree
  ];
}
