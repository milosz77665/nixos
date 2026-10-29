{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-x11.pywal;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    programs.pywal.enable = true;
  };
}
