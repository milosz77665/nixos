{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.theme.cursors;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.pointerCursor = {
      enable = true;
      inherit (cfg) name package size;
      x11.enable = true;
      gtk.enable = true;
    };
  };
}
