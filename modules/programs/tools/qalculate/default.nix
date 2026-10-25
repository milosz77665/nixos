{
  lib,
  ...
}:
{
  options.programs.tools.qalculate = {
    enable = lib.mkEnableOption "Qalculate! (powerful and versatile desktop calculator)";
  };
}
