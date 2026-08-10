{ config, lib, inputs, ... }:
let
  configDir = "${config.home.homeDirectory}/NixOS-Configuration"; # Assumed location of the flake

  _dirToHomeFile =
    modifier: dotfilesStorePath: let
      # Relative path of the dotfiles directory from the flake root
      dotfilesRelDir = lib.removePrefix "${toString inputs.self}/" (toString dotfilesStorePath);
    in
    lib.listToAttrs (
      map (
        absPath:
        let
          # Relative path of the file from the dotfiles directory
          relPath = lib.removePrefix "${toString dotfilesStorePath}/" (toString absPath);
        in
        {
          name = relPath;
          value = {
            source = modifier "${configDir}/${dotfilesRelDir}/${relPath}";
          };
        }
      ) (lib.filesystem.listFilesRecursive dotfilesStorePath)
    );
in
{
  _module.args.myUtils = {
    dirToHomeFileAttr = _dirToHomeFile (x: x);
    dirToHomeFileAttrOutOfStore = _dirToHomeFile (config.lib.file.mkOutOfStoreSymlink);
  };
}
