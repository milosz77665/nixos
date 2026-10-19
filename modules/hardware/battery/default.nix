{
  lib,
  ...
}:
{
  options.hardware.battery = {
    enable = lib.mkEnableOption "TLP power management and battery optimization";
  };
}
