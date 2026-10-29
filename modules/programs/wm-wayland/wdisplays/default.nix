{
  lib,
  ...
}:
{
  options.programs.wm-wayland.wdisplays = {
    enable = lib.mkEnableOption "wdisplays (graphical display configuration tool for Wayland)";
  };
}
