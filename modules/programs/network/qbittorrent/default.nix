{
  lib,
  ...
}:
{
  options.usr.tools.qbittorrent = {
    enable = lib.mkEnableOption "Qbittorrent";
  };
}
