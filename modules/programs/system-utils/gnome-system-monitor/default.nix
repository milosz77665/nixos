{
  lib,
  ...
}:
{
  options.programs.system-utils.gnome-system-monitor = {
    enable = lib.mkEnableOption "GNOME System Monitor (process and resource monitoring tool)";
  };
}
