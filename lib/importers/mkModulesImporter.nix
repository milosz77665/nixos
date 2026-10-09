{ target, basePath }:
{ lib, localLib, ... }@args:
let
  shallowPaths =
    (localLib.importers.mkImporter {
      targets = [
        "default"
        target
      ];
      inherit basePath;
    } args).imports;

  subDirectories = localLib.utils.getDirectories basePath;
  deepPaths = lib.concatMap (
    subDirectory:
    (localLib.importers.mkImporter {
      targets = [
        "default"
        target
      ];
      basePath = basePath + "/${subDirectory}";
    } args).imports
  ) subDirectories;
in
{
  imports = shallowPaths ++ deepPaths;
}
