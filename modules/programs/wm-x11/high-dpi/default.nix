{
  lib,
  ...
}:
{
  options.usr.wm-x11.high-dpi = {
    enable = lib.mkEnableOption "High dpi";
  };
}
