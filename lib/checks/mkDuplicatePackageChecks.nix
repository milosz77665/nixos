{
  pkgs,
  hosts,
}:
{ lib, localLib, ... }:
let
  checkScope =
    hostName: scope: packages:
    let
      duplicates = localLib.utils.getDuplicatePackages packages;
      name = "duplicates-${hostName}-${scope}";

      message =
        if duplicates == { } then
          "ok\n"
        else
          throw ''
            Duplicate package names in ${hostName} (${scope}):
            ${lib.concatMapStringsSep "\n" (
              packageName:
              "  - ${packageName}:\n"
              + lib.concatMapStringsSep "\n" (path: "      ${path}") duplicates.${packageName}
            ) (builtins.attrNames duplicates)}
          '';
    in
    {
      inherit name;
      value = pkgs.writeText name message;
    };

  entries = lib.concatMap (
    hostName: lib.mapAttrsToList (scope: packages: checkScope hostName scope packages) hosts.${hostName}
  ) (builtins.attrNames hosts);
in
builtins.listToAttrs entries
