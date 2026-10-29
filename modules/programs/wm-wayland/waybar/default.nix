{
  lib,
  ...
}:
{
  options.programs.wm-wayland.waybar = {
    enable = lib.mkEnableOption "Waybar (highly customizable status bar for Wayland)";
  };
}
