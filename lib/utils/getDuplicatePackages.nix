{ lib }:
packages:
let
  derivations = builtins.filter (package: lib.isDerivation package) packages;

  grouped = lib.groupBy (package: package.name or (lib.getName package)) derivations;

  differentDerivations = lib.filterAttrs (
    _: entries: builtins.length (lib.unique (builtins.map (package: package.drvPath) entries)) > 1
  ) grouped;
in
builtins.mapAttrs (
  _: entries: lib.unique (builtins.map (package: package.drvPath) entries)
) differentDerivations
