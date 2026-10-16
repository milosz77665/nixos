{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.tools.qbittorrent or config.usr.tools.qbittorrent;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      qbittorrent
    ];
  };
}
