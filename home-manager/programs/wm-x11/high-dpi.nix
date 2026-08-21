{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.wm-x11.high-dpi;
in
{
  options.usr.wm-x11.high-dpi = {
    enable = lib.mkEnableOption "High dpi";
  };

  config = lib.mkIf cfg.enable {
    xresources.properties = {
      "Xft.dpi" = 120;
    };
  };
}
