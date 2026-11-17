{ lib }:
hostsPath: outputName: builder: extraArgs:
let
  hostName = extraArgs.hostName or outputName;
  varsPath = extraArgs.customVarsPath or (hostsPath + "/${hostName}/vars.nix");
in
lib.optionalAttrs (builtins.pathExists varsPath) {
  ${outputName} = builder ({ inherit hostName; } // extraArgs);
}
