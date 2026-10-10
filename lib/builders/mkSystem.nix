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

  vars =
    if customVarsPath != null then
      import customVarsPath
    else if builtins.pathExists ../../hosts/${hostName}/vars.nix then
      import ../../hosts/${hostName}/vars.nix
    else
      import ../../hosts/test/vars.nix;

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
  };

  modules = [
    ../../modules/core/nixos
    (localLib.importers.mkModulesImporter {
      target = "system";
      basePath = ../../modules/programs;
    })
    (localLib.importers.mkModulesImporter {
      target = "system";
      basePath = ../../modules/hardware;
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
              ../../modules/core/essentials.nix
              (localLib.importers.mkModulesImporter {
                target = "home";
                basePath = ../../modules/programs;
              })
              (localLib.importers.mkModulesImporter {
                target = "home";
                basePath = ../../modules/theme;
              })
            ];
          };
      }
    }
  ];
}
