{ inputs, ... }: {
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.npbarnes.imports = [
    ./home-utils.nix
  ];
}
