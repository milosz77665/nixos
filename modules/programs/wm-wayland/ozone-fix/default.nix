{
  lib,
  ...
}:
{
  options.usr.wm-wayland.ozone = {
    enable = lib.mkEnableOption "Ozone";
  };
}
