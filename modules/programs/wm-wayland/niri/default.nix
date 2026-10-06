{
  lib,
  ...
}:
{
  options.usr.wm-wayland.niri = {
    enable = lib.mkEnableOption "Niri";
  };
}
