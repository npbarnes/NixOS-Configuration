{ pkgs, ...} :
{
  home.packages = [
    pkgs.kdePackages.kamoso
    pkgs.kdePackages.dragon
  ];
}
