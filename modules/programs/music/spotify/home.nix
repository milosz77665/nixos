{
  lib,
  pkgs,
  config,

  ...
}:
let
  cfg = config.programs.music.spotify;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
