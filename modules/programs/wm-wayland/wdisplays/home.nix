{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-wayland.wdisplays;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      wdisplays
    ];
  };
}
