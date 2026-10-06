{
  lib,
  ...
}:
{
  options.usr.wm-wayland.swaybg = {
    enable = lib.mkEnableOption "Swaybg";
  };
}
