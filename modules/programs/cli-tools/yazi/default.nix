{
  lib,
  ...
}:
{
  options.usr.cli-tools.yazi = {
    enable = lib.mkEnableOption "Yazi";
  };
}
