{ inputs, localLib }:
{
  hostName,
  system ? "aarch64-linux",
  customVarsPath ? null,
  customModulesPath ? null,
  customNixOnDroidPath ? null,
}:
let
  pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };

  vars = import ./loadVars.nix { inherit hostName customVarsPath; };

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
in

inputs.nix-on-droid.lib.nixOnDroidConfiguration {
  inherit pkgs;

  extraSpecialArgs = {
    inherit vars;
    inherit localLib;
    inherit hostName;
    inherit pkgsUnstable;
    isNixos = false;
  };

  modules = [
    modulesPath
    nixOnDroidPath
    ../../modules/core/display-server.nix
    (localLib.importers.mkModulesImporter {
      target = "droid";
      basePath = ../../modules/programs;
    })
    (localLib.importers.mkModulesImporter {
      target = "droid";
      basePath = ../../modules/theme;
    })
    (localLib.importers.mkModulesImporter {
      target = "droid";
      basePath = ../../modules/desktop;
    })
    {
      home-manager = {
        extraSpecialArgs = {
          inherit vars;
          inherit localLib;
          inherit hostName;
          inherit pkgsUnstable;
          isNixos = false;
        };
        config = {
          programs.home-manager.enable = true;
          home = {
            username = vars.user.name;
            homeDirectory = vars.homeDirectory;
            stateVersion = vars.stateVersion;
          };

          imports = [
            modulesPath
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
          ];
        };
      };
    }
  ];
}
