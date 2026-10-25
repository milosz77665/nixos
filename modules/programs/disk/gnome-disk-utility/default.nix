{
  lib,
  ...
}:
{
  options.programs.disk.gnome-disk-utility = {
    enable = lib.mkEnableOption "GNOME Disks (drive management and formatting utility)";
  };
}
