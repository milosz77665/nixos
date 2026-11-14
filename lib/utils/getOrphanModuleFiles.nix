{ lib }:
let
  getFiles = import ./getFiles.nix { inherit lib; };
in
{
  basePath,
  roots,
  standardFiles ? [
    "default.nix"
    "home.nix"
    "system.nix"
    "droid.nix"
  ],
}:
let
  nixFiles = builtins.filter (file: lib.hasSuffix ".nix" (lib.last file)) (
    getFiles {
      inherit basePath roots;
      ignoredDirectories = [ "dotfiles" ];
    }
  );

  filePath = segments: basePath + ("/" + lib.concatStringsSep "/" segments);
  fileName = file: lib.last file;
  fileDirectory = file: lib.init file;

  isReferenced =
    file:
    let
      directory = filePath (fileDirectory file);
      name = fileName file;
    in
    lib.any (
      candidate:
      builtins.pathExists (directory + "/${candidate}")
      && lib.hasInfix name (builtins.readFile (directory + "/${candidate}"))
    ) standardFiles;
in
builtins.filter (
  file:
  let
    directory = filePath (fileDirectory file);
    name = fileName file;
    hasDefault = builtins.pathExists (directory + "/default.nix");
  in
  if !hasDefault then
    true
  else if lib.elem name standardFiles then
    false
  else
    !(isReferenced file)
) nixFiles
