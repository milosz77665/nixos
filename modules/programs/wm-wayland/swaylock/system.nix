{
  lib,
  config,
  ...
}:
let
  cfg = config.programs.wm-wayland.swaylock;
in
{
  config = lib.mkIf cfg.enable {
    security.pam.services.swaylock = { };
  };
}
