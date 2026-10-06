{
  lib,
  ...
}:
{
  options.usr.notes.obsidian = {
    enable = lib.mkEnableOption "Obsidian";
  };
}
