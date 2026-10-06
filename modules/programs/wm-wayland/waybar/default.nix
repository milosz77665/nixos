{
  lib,
  ...
}:
{
  options.usr.wm-wayland.waybar = {
    enable = lib.mkEnableOption "Waybar";
  };
}
