{
  lib,
  ...
}:
{
  options.sys.bluetooth = {
    enable = lib.mkEnableOption "Bluetooth";
  };
}
