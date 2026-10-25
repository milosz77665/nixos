{
  lib,
  ...
}:
{
  options.programs.system-utils.gnome-system-monitor = {
    enable = lib.mkEnableOption "Gnome System Monitor";
  };
}
