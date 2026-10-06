{ lib }:
path:
if builtins.pathExists path then
  lib.attrNames (lib.filterAttrs (name: t: t == "directory") (builtins.readDir path))
else
  [ ]
