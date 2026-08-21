{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.wm-wayland.swaync;
in
{
  options.usr.wm-wayland.swaync = {
    enable = lib.mkEnableOption "Swaync";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      swaynotificationcenter
    ];
  };
}
