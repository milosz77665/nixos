{
  hostName,
  customVarsPath ? null,
  requireSystemStateVersion ? false,
}:
let
  varsPath = if customVarsPath != null then customVarsPath else ../../hosts/${hostName}/vars.nix;

  hint =
    if customVarsPath != null then
      "The configured customVarsPath does not exist."
    else
      "Copy hosts/vars.example.nix to hosts/${hostName}/vars.nix and fill it in.";

  vars = import varsPath;

  systemStateVersion = vars.systemStateVersion or null;

  validSystemStateVersion =
    builtins.isString systemStateVersion && builtins.match "[0-9]+\\.[0-9]+" systemStateVersion != null;
in
if !(builtins.pathExists varsPath) then
  throw ''
    Missing vars file for host "${hostName}": ${toString varsPath}
    ${hint}
    Local builds must use path:$PWD#${hostName} so Nix sees untracked files.
  ''
else if requireSystemStateVersion && !validSystemStateVersion then
  throw ''
    Missing or invalid systemStateVersion in vars for host "${hostName}": ${toString varsPath}

    Set systemStateVersion to a version such as "25.11".
    It is required for NixOS and nix-on-droid hosts; standalone Home Manager hosts use only homeStateVersion.
  ''
else
  vars
