{
  lib,
  ...
}:
{
  options.programs.wm-wayland.swaync = {
    enable = lib.mkEnableOption "SwayNotificationCenter (notification daemon for Wayland)";
  };
}
