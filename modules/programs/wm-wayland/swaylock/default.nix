{
  lib,
  ...
}:
{
  options.usr.wm-wayland.swaylock = {
    enable = lib.mkEnableOption "Swaylock";
  };
}
