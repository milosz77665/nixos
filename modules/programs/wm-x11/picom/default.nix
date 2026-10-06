{
  lib,
  ...
}:
{
  options.usr.wm-x11.picom = {
    enable = lib.mkEnableOption "Picom";
  };
}
