{ lib, localLib }:
let
  basePath = ../fixtures/getOrphanModuleFiles/modules;
in
{
  "test utils.getOrphanModuleFiles: should return files outside modules and unreferenced module files" =
    {
      expr = localLib.utils.getOrphanModuleFiles {
        inherit basePath;
        roots = [ "programs" ];
      };

      expected = [
        [
          "programs"
          "bad"
          "home.nix"
        ]
        [
          "programs"
          "category"
          "stray.nix"
        ]
      ];
    };
}
