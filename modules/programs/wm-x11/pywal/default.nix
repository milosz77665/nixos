{
  lib,
  ...
}:
{
  options.programs.wm-x11.pywal = {
    enable = lib.mkEnableOption "Pywal (color palette generator from wallpaper images)";
  };
}
