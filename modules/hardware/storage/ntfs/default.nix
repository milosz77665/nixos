{
  lib,
  ...
}:
{
  options.sys.storage.ntfs = {
    enable = lib.mkEnableOption "NTFS";
  };
}
