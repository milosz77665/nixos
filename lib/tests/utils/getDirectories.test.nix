{ lib, localLib }:

{
  "test utils.getDirectories: should return directories and ignore all file types (regular, hidden, no extension)" =
    {
      expr = localLib.utils.getDirectories ../fixtures/getDirectories/mixed-contents;

      expected = [
        ".hidden-dir"
        "audio"
        "video"
      ];
    };

  "test utils.getDirectories: should return an empty list for an empty directory" = {
    expr = localLib.utils.getDirectories ../fixtures/getDirectories/empty-folder;

    expected = [ ];
  };
}
