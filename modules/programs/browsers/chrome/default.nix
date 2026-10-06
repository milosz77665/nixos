{
  lib,
  ...
}:
{
  options.usr.browser.chrome = {
    enable = lib.mkEnableOption "Google Chrome Browser";
  };
}
