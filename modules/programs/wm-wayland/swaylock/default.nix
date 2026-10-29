{
  lib,
  ...
}:
{
  options.programs.wm-wayland.swaylock = {
    enable = lib.mkEnableOption "swaylock (screen locker for Wayland)";
  };
}
