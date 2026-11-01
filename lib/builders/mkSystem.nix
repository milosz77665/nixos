{ inputs, localLib }:
{
  hostName,
  system ? "x86_64-linux",
  customVarsPath ? null,
  customModulesPath ? null,
  customConfigurationPath ? null,
}:
let
  pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };

  vars = import ./loadVars.nix { inherit hostName customVarsPath; };

  modulesPath =
    if customModulesPath != null then customModulesPath else ../../hosts/${hostName}/modules.nix;

  configurationPath =
    if customConfigurationPath != null then
      customConfigurationPath
    else
      ../../hosts/${hostName}/configuration.nix;
in

inputs.nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit vars;
    inherit localLib;
    inherit hostName;
    inherit pkgsUnstable;
    isNixos = true;
  };

  modules = [
    ../../modules/core/nixos
    ../../modules/core/display-server.nix
    (localLib.importers.mkModulesImporter {
      target = "system";
      basePath = ../../modules/programs;
    })
    (localLib.importers.mkModulesImporter {
      target = "system";
      basePath = ../../modules/hardware;
    })
    (localLib.importers.mkModulesImporter {
      target = "system";
      basePath = ../../modules/theme;
    })
    modulesPath
    configurationPath
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "bak";
        extraSpecialArgs = {
          inherit vars;
          inherit localLib;
          inherit hostName;
          inherit pkgsUnstable;
          isNixos = true;
        };
        users.${vars.user.name} =
          { pkgs, ... }:
          {
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
                basePath = ../../modules/hardware;
              })
              (localLib.importers.mkModulesImporter {
                target = "home";
                basePath = ../../modules/theme;
              })
            ];
          };
      };
    }
  ];
}
