{
  lib,
  ...
}:
{
  options.usr.disk.gnome-disk-utility = {
    enable = lib.mkEnableOption "Gnome Disk Utility";
  };
}
