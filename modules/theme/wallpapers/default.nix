{
  lib,
  ...
}:
{
  options.usr.desktop.wallpapers = {
    enable = lib.mkEnableOption "Wallpapers";
  };
}
