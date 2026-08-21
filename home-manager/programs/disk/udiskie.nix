{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.disk.udiskie;
in
{
  options.usr.disk.udiskie = {
    enable = lib.mkEnableOption "Udiskie";
  };

  config = lib.mkIf cfg.enable {
    services.udiskie = {
      enable = true;
      tray = "always";
    };
  };
}
