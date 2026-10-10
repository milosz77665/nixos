{ inputs, localLib }:
{
  hostName,
  system ? "x86_64-linux",
  customVarsPath ? null,
  customModulesPath ? null,
}:
let
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };

  vars =
    if customVarsPath != null then
      import customVarsPath
    else if builtins.pathExists ../../hosts/${hostName}/vars.nix then
      import ../../hosts/${hostName}/vars.nix
    else
      import ../../hosts/test/vars.nix;

  modulesPath =
    if customModulesPath != null then 
      customModulesPath 
    else 
      ../../hosts/${hostName}/modules.nix;
in

inputs.home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  extraSpecialArgs = {
    inherit vars;
    inherit localLib;
    inherit hostName;
    inherit pkgsUnstable;
  };

  modules = [
    ../../modules/core/essentials.nix
    (localLib.importers.mkModulesImporter {
      target = "home";
      basePath = ../../modules/programs;
    })
    (localLib.importers.mkModulesImporter {
      target = "home";
      basePath = ../../modules/theme;
    })
    modulesPath
    {
      programs.home-manager.enable = true;
      home = {
        username = vars.user.name;
        homeDirectory = vars.homeDirectory;
        stateVersion = vars.stateVersion;
      };
    }
  ];
}