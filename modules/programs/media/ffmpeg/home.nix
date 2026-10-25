{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.media.ffmpeg;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ ffmpeg ];
  };
}

