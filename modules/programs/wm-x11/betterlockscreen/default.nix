{
  lib,
  ...
}:
{
  options.sys.wm-x11.betterlockscreen = {
    enable = lib.mkEnableOption "Betterlockscreen";
  };
}
