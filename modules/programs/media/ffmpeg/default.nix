{
  lib,
  ...
}:
{
  options.programs.media.ffmpeg = {
    enable = lib.mkEnableOption "FFmpeg (audio and video converter)";
  };
}

