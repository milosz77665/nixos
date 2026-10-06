{
  lib,
  ...
}:
{
  options.usr.tools.gimp = {
    enable = lib.mkEnableOption "Gimp";
  };
}
