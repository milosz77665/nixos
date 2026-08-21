{
  config,
  lib,
  ...
}:
let
  cfg = config.sys.bluetooth;
in
{
  options.sys.bluetooth = {
    enable = lib.mkEnableOption "Bluetooth";
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    services.blueman.enable = true;
  };
}
