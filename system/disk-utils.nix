{
  config,
  lib,
  ...
}:
let
  cfg = config.sys.disk-utils;
in
{
  options.sys.disk-utils = {
    enable = lib.mkEnableOption "Disk utils";
  };

  config = lib.mkIf cfg.enable {
    services.gvfs.enable = true;
    services.udisks2.enable = true;
    programs.dconf.enable = true;
    services.tumbler.enable = true;

    boot.supportedFilesystems = [ "ntfs" ];

  };
}
