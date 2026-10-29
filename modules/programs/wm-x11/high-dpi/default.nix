{
  lib,
  ...
}:
{
  options.programs.wm-x11.high-dpi = {
    enable = lib.mkEnableOption "High DPI (Xft.dpi scaling for X11 applications)";
  };
}
