{
  lib,
  ...
}:
{
  options.usr.dev.direnv = {
    enable = lib.mkEnableOption "Direnv";
  };
}
