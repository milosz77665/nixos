{
  config,
  lib,
  ...
}:
let
  cfg = config.sys.gaming.steam;
in
{
  options.sys.gaming.steam = {
    enable = lib.mkEnableOption "Steam";
  };

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
