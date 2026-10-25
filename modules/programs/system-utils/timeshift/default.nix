{
  lib,
  ...
}:
{
  options.programs.system-utils.timeshift = {
    enable = lib.mkEnableOption "Timeshift (system backup and restore utility)";
  };
}
