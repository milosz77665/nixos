{ inputs, lib, ... }:
let
  localLib = {
    builders = {
      mkHome = import ./builders/mkHome.nix { inherit inputs localLib; };
      mkSystem = import ./builders/mkSystem.nix { inherit inputs localLib; };
      mkNixOnDroid = import ./builders/mkNixOnDroid.nix { inherit inputs localLib; };
    };
    importers = {
      mkImporter = import ./importers/mkImporter.nix;
      mkModulesImporter = import ./importers/mkModulesImporter.nix;
    };
    utils = {
      getDirectories = import ./utils/getDirectories.nix { inherit lib; };
      getModuleDirectories = import ./utils/getModuleDirectories.nix { inherit lib; };
      getOptionPaths = import ./utils/getOptionPaths.nix { inherit lib; };
      getFiles = import ./utils/getFiles.nix { inherit lib; };
      getOrphanModuleFiles = import ./utils/getOrphanModuleFiles.nix { inherit lib; };
      checkVarsSchema = import ./utils/checkVarsSchema.nix { inherit lib; };
    };
    checks = {
      mkIsolationChecks = import ./checks/mkIsolationChecks.nix;
      mkStructureChecks = import ./checks/mkStructureChecks.nix;
    };
  };
in
localLib
