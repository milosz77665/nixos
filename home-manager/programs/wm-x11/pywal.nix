{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.wm-x11.pywal;
in
{
  options.usr.wm-x11.pywal = {
    enable = lib.mkEnableOption "Pywal";
  };

  config = lib.mkIf cfg.enable {
    programs.pywal.enable = true;
  };
}
