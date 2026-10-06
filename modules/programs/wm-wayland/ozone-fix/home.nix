{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-wayland.ozone or config.usr.wm-wayland.ozone;
in
{
  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
