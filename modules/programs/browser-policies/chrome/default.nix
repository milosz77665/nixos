{
  lib,
  ...
}:
{
  options.sys.browser-policies.chrome = {
    enable = lib.mkEnableOption "Chrome policies";
  };
}
