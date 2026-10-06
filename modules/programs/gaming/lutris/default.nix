{
  lib,
  ...
}:
{
  options.usr.gaming.lutris = {
    enable = lib.mkEnableOption "Lutris";
  };
}
