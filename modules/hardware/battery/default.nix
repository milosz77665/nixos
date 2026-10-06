{
  lib,
  ...
}:
{
  options.sys.battery = {
    enable = lib.mkEnableOption "Battery";
  };
}
