{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.music.spotify or config.usr.music.spotify;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
