{
  lib,
  ...
}:
{
  options.usr.gaming.wine = {
    enable = lib.mkEnableOption "Wine";
  };
}
