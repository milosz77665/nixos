{
  lib,
  ...
}:
{
  options.programs.network.qbittorrent = {
    enable = lib.mkEnableOption "qBittorrent";
  };
}
