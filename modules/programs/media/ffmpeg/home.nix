{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.media.ffmpeg or config.usr.media.ffmpeg;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ ffmpeg ];
  };
}

