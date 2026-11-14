{ lib, localLib }:
let
  basePath = ../fixtures/getFiles;
in
{
  "test utils.getFiles: should list files recursively and skip ignored directories" = {
    expr = localLib.utils.getFiles {
      inherit basePath;
      roots = [ "basic" ];
      ignoredDirectories = [ "dotfiles" ];
    };

    expected = [
      [
        "basic"
        "nested"
        "nested.txt"
      ]
      [
        "basic"
        "root.txt"
      ]
    ];
  };

  "test utils.getFiles: should include files in non-ignored directories" = {
    expr = localLib.utils.getFiles {
      inherit basePath;
      roots = [ "basic" ];
    };

    expected = [
      [
        "basic"
        "nested"
        "dotfiles"
        "ignored.txt"
      ]
      [
        "basic"
        "nested"
        "nested.txt"
      ]
      [
        "basic"
        "root.txt"
      ]
    ];
  };
}
