{
  lib,
  ...
}:
{
  options.programs.wm-x11.arandr = {
    enable = lib.mkEnableOption "arandr (graphical interface for xrandr screen configuration)";
  };
}
