{
  basePath,
  pkgs,
  roots,
}:
{ lib, localLib, ... }:
let
  modules = localLib.utils.getModuleDirectories { inherit basePath roots; };

  pathToString = path: lib.concatStringsSep "." path;

  checkModule =
    module:
    let
      declared = localLib.utils.getOptionPaths (
        lib.evalModules { modules = [ (module.path + "/default.nix") ]; }
      ).options;

      wrong = builtins.filter (
        path: lib.take (builtins.length module.relative) path != module.relative
      ) declared;
      enablePath = module.relative ++ [ "enable" ];
      hasEnable = lib.elem enablePath declared;

      message =
        if wrong != [ ] then
          throw ''
            Module ${module.name} declares options outside its directory:
            ${lib.concatMapStringsSep "\n" (path: "  - ${pathToString path}") wrong}
          ''
        else if !hasEnable then
          throw "Module ${module.name} does not declare ${pathToString enablePath}."
        else
          "ok\n";
    in
    {
      name = "structure-${module.name}";
      value = pkgs.writeText "structure-${module.name}" message;
    };

  orphanFiles = localLib.utils.getOrphanModuleFiles { inherit basePath roots; };

  layoutMessage =
    if orphanFiles == [ ] then
      "ok\n"
    else
      throw ''
        Found module files outside a module directory or not imported by it:
        ${lib.concatMapStringsSep "\n" (file: "  - ${pathToString file}") orphanFiles}
      '';

  varsFixtures = [
    ../../hosts/vars.example.nix
    ../../hosts/test/vars.nix
    ../../hosts/test/mac/vars.nix
    ../../hosts/test/droid/vars.nix
  ];

  checkVarsFile =
    path:
    let
      errors = localLib.utils.checkVarsSchema { vars = import path; };
    in
    builtins.map (error: "${toString path}: ${error}") errors;

  varsErrors = lib.concatMap checkVarsFile varsFixtures;

  varsMessage =
    if varsErrors == [ ] then
      "ok\n"
    else
      throw ''
        Invalid vars files:
        ${lib.concatMapStringsSep "\n" (error: "  - ${error}") varsErrors}
      '';
in
builtins.listToAttrs (
  builtins.map checkModule modules
  ++ [
    {
      name = "structure-layout";
      value = pkgs.writeText "structure-layout" layoutMessage;
    }
    {
      name = "structure-vars-example";
      value = pkgs.writeText "structure-vars-example" varsMessage;
    }
  ]
)
