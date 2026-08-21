{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.wm-wayland.ozone;
in
{
  options.usr.wm-wayland.ozone = {
    enable = lib.mkEnableOption "Ozone";
  };

  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
