{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.tools.qbittorrent;
in
{
  options.usr.tools.qbittorrent = {
    enable = lib.mkEnableOption "Qbittorrent";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      qbittorrent
    ];
  };
}
