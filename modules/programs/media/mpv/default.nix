{
  lib,
  ...
}:
{
  options.usr.media.mpv = {
    enable = lib.mkEnableOption "mpv media player";
  };
}

