{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-wayland.swaybg or config.usr.wm-wayland.swaybg;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      swaybg
    ];
  };
}
