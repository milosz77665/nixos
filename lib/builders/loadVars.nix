{ hostName, customVarsPath ? null }:
let
  varsPath =
    if customVarsPath != null then
      customVarsPath
    else
      ../../hosts/${hostName}/vars.nix;

  hint =
    if customVarsPath != null then
      "The configured customVarsPath does not exist."
    else
      "Copy hosts/vars.example.nix to hosts/${hostName}/vars.nix and fill it in.";
in
if builtins.pathExists varsPath then
  import varsPath
else
  throw ''
    Missing vars file for host "${hostName}": ${toString varsPath}
    ${hint}
    Local builds must use path:$PWD#${hostName} so Nix sees untracked files.
  ''
