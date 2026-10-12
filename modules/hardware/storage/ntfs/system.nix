{
  lib,
  config,
  isNixos,
  ...
}:
let
  cfg = config.sys.storage.ntfs;
in
{
  config = lib.mkIf cfg.enable {
    boot.supportedFilesystems = lib.mkIf isNixos [ "ntfs" ];
  };
}