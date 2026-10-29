{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-wayland.swaync;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      swaynotificationcenter
    ];
  };
}
