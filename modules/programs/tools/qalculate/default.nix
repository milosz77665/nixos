{
  lib,
  ...
}:
{
  options.usr.tools.qalculate = {
    enable = lib.mkEnableOption "Qalculate";
  };
}
