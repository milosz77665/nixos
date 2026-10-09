{
  basePath,
  system ? "x86_64-linux",
}:
{ lib, localLib, ... }@args:
let
  allModules =
    (localLib.importers.mkModulesImporter {
      target = "default";
      inherit basePath;
    } args).imports;

  checks = builtins.listToAttrs (
    builtins.map (
      modulePath:
      let
        moduleName = builtins.baseNameOf (builtins.dirOf modulePath);
      in
      {
        name = "isolation-${moduleName}";
        value =
          (lib.nixosSystem {
            inherit system;
            modules = [
              (
                { ... }:
                {
                  system.stateVersion = "25.11";
                  boot.isContainer = true;
                }
              )
              modulePath
            ];
          }).config.system.build.toplevel;
      }
    ) allModules
  );
in
checks
