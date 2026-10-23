{
  lib,
  ...
}:
{
  options.hardware.bt = {
    enable = lib.mkEnableOption "Bluetooth hardware support and Blueman applet";
  };
}
