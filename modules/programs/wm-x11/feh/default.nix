{
  lib,
  ...
}:
{
  options.programs.wm-x11.feh = {
    enable = lib.mkEnableOption "feh (lightweight image viewer and wallpaper setter for X11)";
  };
}
