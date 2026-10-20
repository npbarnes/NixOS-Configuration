# Adds spell checking and dictionaries that are used by many text editors.
{ pkgs, ... }: {
  home.packages = [
    pkgs.hunspell
    pkgs.hunspellDicts.en_US-large
    pkgs.aspell
    pkgs.aspellDicts.en
  ];
}
