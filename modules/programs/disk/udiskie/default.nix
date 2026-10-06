{
  lib,
  ...
}:
{
  options.usr.disk.udiskie = {
    enable = lib.mkEnableOption "Udiskie";
  };
}
