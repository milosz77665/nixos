{
  lib,
  ...
}:
{
  options.sys.tools.virtualbox = {
    enable = lib.mkEnableOption "Virtualbox";
  };
}
