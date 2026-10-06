{
  lib,
  ...
}:
{
  options.usr.wm-x11.pywal = {
    enable = lib.mkEnableOption "Pywal";
  };
}
