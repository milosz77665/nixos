{
  lib,
  config,
  isNixOS,
  ...
}:
let
  cfg = config.sys.storage.ntfs;
in
{
  config = lib.mkIf cfg.enable {
    boot.supportedFilesystems = lib.mkIf isNixOS [ "ntfs" ];
  };
}