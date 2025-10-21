{pkgs, ...} : {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.enableUpdateCheck = true;
    profiles.default.enableExtensionUpdateCheck = true;
    profiles.default.extensions = [
      pkgs.vscode-marketplace.bbenoist.nix
      pkgs.vscode-marketplace.julialang.language-julia
    ];
    profiles.python.extensions = [
      pkgs.vscode-marketplace.ms-python.python
    ];
  };
}
