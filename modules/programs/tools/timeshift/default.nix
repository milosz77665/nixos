{
  lib,
  ...
}:
{
  options.sys.tools.timeshift = {
    enable = lib.mkEnableOption "Timeshift";
  };
}
