{
  lib,
  ...
}:
{
  options.usr.browser.firefox = {
    enable = lib.mkEnableOption "Firefox Browser";
  };
}
