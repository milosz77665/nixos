{
  lib,
  config,
  ...
}:
let
  cfg = config.usr.wm-wayland.swaylock;
in
{
  config = lib.mkIf cfg.enable {
    security.pam.services.swaylock = { };
  };
}
