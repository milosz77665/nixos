{ lib }:
{
  basePath,
  roots ? null,
  ignoredDirectories ? [ ],
}:
let
  listFiles =
    prefix: directory:
    lib.concatLists (
      lib.mapAttrsToList (
        name: type:
        if type == "directory" then
          if lib.elem name ignoredDirectories then
            [ ]
          else
            listFiles (prefix ++ [ name ]) (directory + "/${name}")
        else
          [ (prefix ++ [ name ]) ]
      ) (builtins.readDir directory)
    );
in
if roots == null then
  listFiles [ ] basePath
else
  lib.concatMap (root: listFiles [ root ] (basePath + "/${root}")) roots
