{
  lib,
  config,
  ...
}:
let
  cfg = config.sys.gaming.steam;
in
{
  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
