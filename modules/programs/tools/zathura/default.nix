{
  lib,
  ...
}:
{
  options.usr.tools.zathura = {
    enable = lib.mkEnableOption "Zathura";
  };
}
