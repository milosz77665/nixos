{ lib }:
let
  getDirectories = import ./getDirectories.nix { inherit lib; };
in
{
  basePath,
  roots ? null,
}:
let
  walk =
    prefix: directory:
    lib.concatMap (
      name:
      let
        path = directory + "/${name}";
        relative = prefix ++ [ name ];
      in
      if builtins.pathExists (path + "/default.nix") then
        [
          {
            inherit path relative;
            name = lib.concatStringsSep "-" relative;
          }
        ]
      else
        walk relative path
    ) (getDirectories directory);
in
if roots == null then
  walk [ ] basePath
else
  lib.concatMap (root: walk [ root ] (basePath + "/${root}")) roots
