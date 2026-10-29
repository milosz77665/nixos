{
  lib,
  ...
}:
{
  options.programs.wm-x11.rofi = {
    enable = lib.mkEnableOption "Rofi (application launcher and window switcher for X11)";
  };
}
