{
  lib,
  ...
}:
{
  options.programs.wm-x11.betterlockscreen = {
    enable = lib.mkEnableOption "Betterlockscreen (lock screen utility for X11)";
  };
}
