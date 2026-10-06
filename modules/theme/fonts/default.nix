{
  lib,
  ...
}:
{
  options.usr.desktop.fonts = {
    enable = lib.mkEnableOption "Fonts";
  };
}
