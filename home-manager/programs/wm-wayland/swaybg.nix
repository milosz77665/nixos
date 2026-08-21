{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.wm-wayland.swaybg;
in
{
  options.usr.wm-wayland.swaybg = {
    enable = lib.mkEnableOption "Swaybg";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      swaybg
    ];
  };
}
