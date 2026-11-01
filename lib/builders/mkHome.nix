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

  vars = import ./loadVars.nix { inherit hostName customVarsPath; };

  modulesPath =
    if customModulesPath != null then customModulesPath else ../../hosts/${hostName}/modules.nix;
in

inputs.home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  extraSpecialArgs = {
    inherit vars;
    inherit localLib;
    inherit hostName;
    inherit pkgsUnstable;
    isNixos = false;
  };

  modules = [
    ../../modules/core/essentials.nix
    ../../modules/core/display-server.nix
    (localLib.importers.mkModulesImporter {
      target = "home";
      basePath = ../../modules/programs;
    })
    (localLib.importers.mkModulesImporter {
      target = "home";
      basePath = ../../modules/theme;
    })
    (localLib.importers.mkModulesImporter {
      target = "home";
      basePath = ../../modules/desktop;
    })
    modulesPath
    {
      programs.home-manager.enable = true;
      targets.genericLinux.enable = pkgs.stdenv.isLinux;
      home = {
        username = vars.user.name;
        homeDirectory = vars.homeDirectory;
        stateVersion = vars.stateVersion;
      };
    }
  ];
}
