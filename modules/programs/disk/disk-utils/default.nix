{
  lib,
  ...
}:
{
  options.programs.disk.disk-utils = {
    enable = lib.mkEnableOption "Disk utilities and filesystem support (GVFS, UDisks2, NTFS)";
  };
}
