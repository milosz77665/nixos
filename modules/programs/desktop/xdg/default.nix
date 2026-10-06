{
  lib,
  ...
}:
{
  options.usr.desktop.xdg = {
    enable = lib.mkEnableOption "Xdg";
  };
}
