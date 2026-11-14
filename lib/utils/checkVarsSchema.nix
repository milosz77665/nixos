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
    [ "stateVersion" ]
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
}:
let
  pathToString = path: lib.concatStringsSep "." path;
  get = path: lib.attrByPath path null vars;

  missing = builtins.filter (path: get path == null) requiredPaths;

  notString = builtins.filter (
    path:
    let
      value = get path;
    in
    value != null && !(lib.isString value)
  ) requiredPaths;

  stateVersion = get [ "stateVersion" ];
  homeDirectory = get [ "homeDirectory" ];
in
builtins.map (path: "missing ${pathToString path}") missing
++ builtins.map (path: "${pathToString path} is not a string") notString
++ lib.optional (lib.isString stateVersion && builtins.match "[0-9]+\\.[0-9]+" stateVersion == null)
  "stateVersion must look like 25.11"
++ lib.optional (lib.isString homeDirectory && !(lib.hasPrefix "/" homeDirectory))
  "homeDirectory must be an absolute path"
