{
  lib,
  config,
  ...
}:
let
  cfg = config.hardware.storage.ntfs;
in
{
  config = lib.mkIf cfg.enable {
    boot.supportedFilesystems = [ "ntfs" ];
  };
}
