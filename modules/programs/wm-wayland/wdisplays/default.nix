{
  lib,
  ...
}:
{
  options.usr.wm-wayland.wdisplays = {
    enable = lib.mkEnableOption "Wdisplays";
  };
}
