{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-x11.high-dpi;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    xresources.properties = {
      "Xft.dpi" = 120;
    };
  };
}
