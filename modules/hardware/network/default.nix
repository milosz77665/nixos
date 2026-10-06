{
  lib,
  ...
}:
{
  options.sys.network = {
    enable = lib.mkEnableOption "Network";
  };
}
