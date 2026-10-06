{
  targets,
  basePath,
}:
{ lib, localLib, ... }:
let
  directories = localLib.utils.getDirectories basePath;

  collectFiles =
    directory:
    lib.concatMap (
      target:
      let
        targetPath = basePath + "/${directory}/${target}.nix";
      in
      lib.optional (builtins.pathExists targetPath) targetPath
    ) targets;
in
{
  imports = lib.concatMap collectFiles directories;
}
