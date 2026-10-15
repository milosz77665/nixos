{
  lib,
  ...
}:
{
  options.programs.browsers.chrome = {
    enable = lib.mkEnableOption "Google Chrome Browser";
  };
}
