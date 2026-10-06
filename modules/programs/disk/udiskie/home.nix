{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.disk.udiskie or config.usr.disk.udiskie;
in
{
  config = lib.mkIf cfg.enable {
    services.udiskie = {
      enable = true;
      tray = "always";
    };
  };
}
