{
  lib,
  ...
}:
{
  options.sys.secrets = {
    enable = lib.mkEnableOption "Secrets";
  };
}
