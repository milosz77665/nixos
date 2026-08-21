{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.wm-x11.feh;
in
{
  options.usr.wm-x11.feh = {
    enable = lib.mkEnableOption "Feh";
  };

  config = lib.mkIf cfg.enable {
    programs.feh.enable = true;
  };
}
