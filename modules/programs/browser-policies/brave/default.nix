{
  lib,
  ...
}:
{
  options.sys.browser-policies.brave = {
    enable = lib.mkEnableOption "Brave policies";
  };
}
