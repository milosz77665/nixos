{
  lib,
  ...
}:
{
  options.usr.wm-x11.flameshot = {
    enable = lib.mkEnableOption "Flameshot";
  };
}
