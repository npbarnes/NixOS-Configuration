{
  config,
  lib,
  inputs,
  ...
}:
let
  configDir = "${config.home.homeDirectory}/NixOS-Configuration"; # Assumed location of the flake

  listFilesRecursiveIfExists = path: if builtins.pathExists path
    then lib.filesystem.listFilesRecursive path
    else [];

  _dirToHomeFileIfExists =
    modifier: dotfilesStorePath:
    let
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
      ) (listFilesRecursiveIfExists dotfilesStorePath)
    );
in
{
  _module.args.myUtils = {
    dirToHomeFileAttrIfExists = _dirToHomeFileIfExists (x: x);
    dirToHomeFileAttrOutOfStoreIfExists = _dirToHomeFileIfExists (config.lib.file.mkOutOfStoreSymlink);
  };
}
