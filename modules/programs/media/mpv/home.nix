{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.media.mpv or config.usr.media.mpv;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ mpv ];
  };
}


