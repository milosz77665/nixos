{
  lib,
  ...
}:
{
  options.programs.media.mpv = {
    enable = lib.mkEnableOption "mpv (media player)";
  };
}

