{ lib, localLib }:

{
  "test importers.mkImporter: should import only existing target files and ignore missing ones" = {
    expr = localLib.importers.mkImporter {
      targets = [
        "default"
        "system"
      ];
      basePath = ../fixtures/mkImporter/modules;
    } { inherit lib localLib; };

    expected = {
      imports = [
        ../fixtures/mkImporter/modules/audio/default.nix
        ../fixtures/mkImporter/modules/audio/system.nix

        ../fixtures/mkImporter/modules/video/default.nix
      ];
    };
  };

  "test importers.mkImporter: should return empty imports array if no requested targets exist" = {
    expr = localLib.importers.mkImporter {
      targets = [ "droid" ];
      basePath = ../fixtures/mkImporter/modules;
    } { inherit lib localLib; };

    expected = {
      imports = [ ];
    };
  };
}
