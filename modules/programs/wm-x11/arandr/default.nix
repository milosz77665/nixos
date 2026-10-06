{
  lib,
  ...
}:
{
  options.usr.wm-x11.arandr = {
    enable = lib.mkEnableOption "Arandr";
  };
}
