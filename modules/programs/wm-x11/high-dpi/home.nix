{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-x11.high-dpi or config.usr.wm-x11.high-dpi;
in
{
  config = lib.mkIf cfg.enable {
    xresources.properties = {
      "Xft.dpi" = 120;
    };
  };
}
