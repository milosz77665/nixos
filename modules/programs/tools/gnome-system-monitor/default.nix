{
  lib,
  ...
}:
{
  options.usr.tools.gnome-system-monitor = {
    enable = lib.mkEnableOption "Gnome System Monitor";
  };
}
