{
  lib,
  ...
}:
{
  options.programs.wm-x11.picom = {
    enable = lib.mkEnableOption "Picom (compositor for X11 with blur and transparency)";
  };
}
