{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.music.spotify;
in
{
  options.usr.music.spotify = {
    enable = lib.mkEnableOption "Spotify";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
