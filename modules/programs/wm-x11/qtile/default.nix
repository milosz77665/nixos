{
  lib,
  ...
}:
{
  options.usr.wm-x11.qtile = {
    enable = lib.mkEnableOption "Qtile";
  };
}
