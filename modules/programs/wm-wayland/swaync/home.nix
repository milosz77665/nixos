{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-wayland.swaync or config.usr.wm-wayland.swaync;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      swaynotificationcenter
    ];
  };
}
