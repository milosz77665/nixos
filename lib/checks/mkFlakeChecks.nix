{
  self,
  inputs,
  lib,
  localLib,
}:
let
  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  roots = localLib.flake.moduleRoots;
  nixosHomePackages = localLib.flake.nixosHomePackages self;
in
{
  x86_64-linux =
    localLib.checks.mkIsolationChecks {
      basePath = ../../modules;
      inherit roots pkgs;
    } { inherit lib localLib; }
    // localLib.checks.mkStructureChecks {
      basePath = ../../modules;
      inherit roots pkgs;
    } { inherit lib localLib; }
    // localLib.checks.mkModuleEvalChecks {
      basePath = ../../modules;
      inherit roots;
      inherit (inputs) nixpkgs nixpkgs-unstable;
      varsPath = ../../hosts/test/vars.nix;
      droidVarsPath = ../../hosts/test/droid/vars.nix;
      checkPkgs = pkgs;
    } { inherit lib localLib; }
    // localLib.checks.mkDuplicatePackageChecks {
      inherit pkgs;
      hosts = {
        testWayland = {
          home = nixosHomePackages "testWayland";
          system = self.nixosConfigurations.testWayland.config.environment.systemPackages;
        };
        testX11 = {
          home = nixosHomePackages "testX11";
          system = self.nixosConfigurations.testX11.config.environment.systemPackages;
        };
        testHome = {
          home = self.homeConfigurations.testHome.config.home.packages;
        };
        testMac = {
          home = self.homeConfigurations.testMac.config.home.packages;
        };
        testDroid = {
          home = self.nixOnDroidConfigurations.testDroid.config.home-manager.config.home.packages;
        };
      };
    } { inherit lib localLib; }
    // {
      host-testWayland = self.nixosConfigurations.testWayland.config.system.build.toplevel;
      host-testX11 = self.nixosConfigurations.testX11.config.system.build.toplevel;
      host-testHome = self.homeConfigurations.testHome.activationPackage;
      eval-testDroid = pkgs.writeText "eval-testDroid" (
        builtins.toJSON {
          theme = builtins.attrNames self.nixOnDroidConfigurations.testDroid.config.home-manager.config.theme;
          homeDirectory =
            self.nixOnDroidConfigurations.testDroid.config.home-manager.config.home.homeDirectory;
        }
      );
    };

  aarch64-darwin = {
    host-testMac = self.homeConfigurations.testMac.activationPackage;
  };
}
