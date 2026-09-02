{
  programs.git = {
    enable = true;
    ignores = [
      "__pycache__"
      "*.swp"
      ".direnv"
      ".envrc"
    ];
    settings = {
      core.editor = "nvim";
      user.name = "Nathan Barnes";
      user.email = "nathanpaulbarnes@gmail.com";
      column.ui = "auto";
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      init.defaultBranch = "main";
      diff = {
        algorithm = "histogram";
        colorMoved = "zebra";
        mnemonicPrefix = true;
        renames = true;
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };
      pull.rebase = true;
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };
      commit.verbose = true;
      merge.conflictstyle = "zdiff3";
    };
  };
}
