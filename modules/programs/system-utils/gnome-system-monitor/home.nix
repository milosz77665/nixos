{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.system-utils.gnome-system-monitor;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      gnome-system-monitor
    ];
  };
}
