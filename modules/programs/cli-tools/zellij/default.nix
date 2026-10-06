{
  lib,
  ...
}:
{
  options.usr.cli-tools.zellij = {
    enable = lib.mkEnableOption "Zellij";
  };
}
