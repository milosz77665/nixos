{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-x11.feh;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    programs.feh.enable = true;
  };
}
