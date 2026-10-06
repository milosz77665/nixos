{
  lib,
  ...
}:
{
  options.usr.music.spotify = {
    enable = lib.mkEnableOption "Spotify";
  };
}
