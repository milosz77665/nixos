{
  lib,
  ...
}:
{
  options.programs.notes.obsidian = {
    enable = lib.mkEnableOption "Obsidian";
  };
}
