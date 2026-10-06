{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-x11.pywal or config.usr.wm-x11.pywal;
in
{
  config = lib.mkIf cfg.enable {
    programs.pywal.enable = true;
  };
}
