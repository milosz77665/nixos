{
  lib,
  ...
}:
{
  options.usr.file-managers.thunar = {
    enable = lib.mkEnableOption "Thunar File Manager";
  };
}
