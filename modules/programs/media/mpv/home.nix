{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.media.mpv;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [ mpv ];
  };
}


