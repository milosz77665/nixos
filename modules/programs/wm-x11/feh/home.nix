{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-x11.feh or config.usr.wm-x11.feh;
in
{
  config = lib.mkIf cfg.enable {
    programs.feh.enable = true;
  };
}
