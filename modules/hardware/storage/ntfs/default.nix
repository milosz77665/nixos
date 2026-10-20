{
  lib,
  ...
}:
{
  options.hardware.storage.ntfs = {
    enable = lib.mkEnableOption "NTFS filesystem support";
  };
}
