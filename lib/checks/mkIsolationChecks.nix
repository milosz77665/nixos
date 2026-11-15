{
  basePath,
  pkgs,
  roots,
}:
{ lib, localLib, ... }:
let
  modules = localLib.utils.getModuleDirectories { inherit basePath roots; };

  checks = builtins.listToAttrs (
    builtins.map (
      module:
      let
        evaluated = lib.evalModules {
          modules = [ (module.path + "/default.nix") ];
        };

        # Force option declarations to evaluate the module without building a system.
        optionNames = builtins.attrNames evaluated.options;
        name = "isolation-${module.name}";
      in
      {
        inherit name;
        value = pkgs.writeText name (
          if optionNames == [ ] then
            throw "Module ${module.name} does not declare any options."
          else
            "ok\n"
        );
      }
    ) modules
  );
in
checks
