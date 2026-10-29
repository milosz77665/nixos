{
  lib,
  ...
}:
{
  options.programs.wm-wayland.swaybg = {
    enable = lib.mkEnableOption "swaybg (wallpaper utility for Wayland)";
  };
}
