{
  lib,
  config,
  osConfig ? {},
  isNixOS,
  ...
}:
let
  cfg = osConfig.sys.storage.ntfs or config.sys.storage.ntfs;
in
{
  config = lib.mkIf cfg.enable {
    boot.supportedFilesystems = lib.mkIf isNixOS [ "ntfs" ];
  };
}