{
  lib,
  ...
}:
{
  options.sys.tools.docker = {
    enable = lib.mkEnableOption "Docker";
  };
}
