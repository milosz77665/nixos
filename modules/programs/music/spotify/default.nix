{
  lib,
  ...
}:
{
  options.programs.music.spotify = {
    enable = lib.mkEnableOption "Spotify";
  };
}
