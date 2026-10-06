{
  lib,
  ...
}:
{
  options.usr.wm-wayland.swaync = {
    enable = lib.mkEnableOption "Swaync";
  };
}
