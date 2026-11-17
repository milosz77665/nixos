{ lib }:
{
  vars,
  requiredPaths ? [
    [
      "user"
      "name"
    ]
    [
      "user"
      "fullName"
    ]
    [ "homeStateVersion" ]
    [ "homeDirectory" ]
    [
      "git"
      "username"
    ]
    [
      "git"
      "email"
    ]
  ],
  requireSystemStateVersion ? false,
}:
let
  pathToString = path: lib.concatStringsSep "." path;
  get = path: lib.attrByPath path null vars;

  required = lib.unique (
    requiredPaths ++ lib.optional requireSystemStateVersion [ "systemStateVersion" ]
  );
  validated = lib.unique (requiredPaths ++ [ [ "systemStateVersion" ] ]);

  missing = builtins.filter (path: get path == null) required;

  notString = builtins.filter (
    path:
    let
      value = get path;
    in
    value != null && !(lib.isString value)
  ) validated;

  homeStateVersion = get [ "homeStateVersion" ];
  systemStateVersion = get [ "systemStateVersion" ];
  homeDirectory = get [ "homeDirectory" ];
in
builtins.map (path: "missing ${pathToString path}") missing
++ builtins.map (path: "${pathToString path} is not a string") notString
++ lib.optional (
  lib.isString homeStateVersion && builtins.match "[0-9]+\\.[0-9]+" homeStateVersion == null
) "homeStateVersion must look like 25.11"
++ lib.optional (
  lib.isString systemStateVersion && builtins.match "[0-9]+\\.[0-9]+" systemStateVersion == null
) "systemStateVersion must look like 25.11"
++ lib.optional (
  lib.isString homeDirectory && !(lib.hasPrefix "/" homeDirectory)
) "homeDirectory must be an absolute path"
