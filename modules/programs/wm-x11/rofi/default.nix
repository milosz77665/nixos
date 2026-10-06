{
  lib,
  ...
}:
{
  options.usr.wm-x11.rofi = {
    enable = lib.mkEnableOption "Rofi";
  };
}
