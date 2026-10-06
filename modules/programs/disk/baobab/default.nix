{
  lib,
  ...
}:
{
  options.usr.disk.baobab = {
    enable = lib.mkEnableOption "Baobab";
  };
}
