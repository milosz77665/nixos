{
  lib,
  ...
}:
{
  options.programs.wm-x11.qtile = {
    enable = lib.mkEnableOption "Qtile (tiling window manager for X11)";
  };
}
