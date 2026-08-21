{
  config,
  lib,
  ...
}:
let
  cfg = config.sys.wm-wayland.swaylock;
in
{
  options.sys.wm-wayland.swaylock = {
    enable = lib.mkEnableOption "Swaylock";
  };

  config = lib.mkIf cfg.enable {
    security.pam.services.swaylock = { };
  };
}
