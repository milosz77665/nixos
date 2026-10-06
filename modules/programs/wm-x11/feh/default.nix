{
  lib,
  ...
}:
{
  options.usr.wm-x11.feh = {
    enable = lib.mkEnableOption "Feh";
  };
}
