{
  lib,
  ...
}:
{
  options.usr.media.ffmpeg = {
    enable = lib.mkEnableOption "FFmpeg audio and video converter";
  };
}

