{
  lib,
  ...
}:
{
  options.hardware.bluetooth = {
    enable = lib.mkEnableOption "Bluetooth hardware support and Blueman applet";
  };
}
