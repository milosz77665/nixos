{
  lib,
  ...
}:
{
  options.sys.disk-utils = {
    enable = lib.mkEnableOption "Disk utils";
  };
}
