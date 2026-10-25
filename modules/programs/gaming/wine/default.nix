{
  lib,
  ...
}:
{
  options.programs.gaming.wine = {
    enable = lib.mkEnableOption "Wine (compatibility layer for Windows applications and games)";
  };
}
