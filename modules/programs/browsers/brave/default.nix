{
  lib,
  ...
}:
{
  options.usr.browser.brave = {
    enable = lib.mkEnableOption "Brave Browser";
  };
}
