{
  lib,
  ...
}:
{
  options.programs.browsers.firefox = {
    enable = lib.mkEnableOption "Firefox Browser";
  };
}
