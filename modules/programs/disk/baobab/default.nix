{
  lib,
  ...
}:
{
  options.programs.disk.baobab = {
    enable = lib.mkEnableOption "baobab (GNOME Disk Usage Analyzer)";
  };
}
