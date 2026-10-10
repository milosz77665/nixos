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
    };
    checks = {
      mkIsolationChecks = import ./checks/mkIsolationChecks.nix;
    };
  };
in
localLib
