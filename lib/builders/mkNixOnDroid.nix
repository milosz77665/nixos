{ inputs }:
{
  hostName,
  system ? "aarch64-linux",
  customVarsPath ? null,
  customModulesPath ? null,
  customNixOnDroidPath ? null,
}:

let
  vars =
    if customVarsPath != null then
      import customVarsPath
    else if builtins.pathExists ../../hosts/${hostName}/vars.nix then
      import ../../hosts/${hostName}/vars.nix
    else
      import ../../hosts/test/vars.nix;

  modulesPath =
    if customModulesPath != null then customModulesPath else ../../hosts/${hostName}/modules.nix;

  nixOnDroidPath =
    if customNixOnDroidPath != null then
      customNixOnDroidPath
    else
      ../../hosts/${hostName}/nix-on-droid.nix;

  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };
in

inputs.nix-on-droid.lib.nixOnDroidConfiguration {
  inherit pkgs;

  extraSpecialArgs = {
    inherit vars;
    inherit hostName;
    inherit pkgsUnstable;
  };

  modules = [
    modulesPath
    nixOnDroidPath
    {
      home-manager.config = {
        _module.args = {
          inherit vars;
          inherit hostName;
          inherit pkgsUnstable;
        };

        imports = [
          ../../home-manager
          ../../home-manager/programs
        ];
      };
    }
  ];
}
