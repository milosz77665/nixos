{
  lib,
  ...
}:
{
  options.usr.wm-wayland.flameshot = {
    enable = lib.mkEnableOption "Flameshot";
  };
}
