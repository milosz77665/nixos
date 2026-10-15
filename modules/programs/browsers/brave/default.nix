{
  lib,
  ...
}:
{
  options.programs.browsers.brave = {
    enable = lib.mkEnableOption "Brave Browser";
  };
}
