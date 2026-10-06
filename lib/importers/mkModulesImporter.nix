{
  target,
  basePath,
  deep ? false,
}:
{ lib, localLib, ... }:
let
  shallowImport = localLib.importers.mkImporter {
    targets = [
      "default"
      target
    ];
    inherit basePath;
  };

  subDirectories = localLib.utils.getDirectories basePath;

  deepImports = lib.map (
    subDirectory:
    localLib.importers.mkImporter {
      targets = [
        "default"
        target
      ];
      basePath = basePath + "/${subDirectory}";
    }
  ) subDirectories;
in
{
  imports = if deep then deepImports else [ shallowImport ];
}
