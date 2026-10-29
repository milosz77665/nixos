{
  lib,
  ...
}:
{
  options.theme.wallpapers = {
    enable = lib.mkEnableOption "Wallpapers (wallpaper collection installed in the home directory)";
  };
}
