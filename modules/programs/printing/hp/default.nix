{
  lib,
  ...
}:
{
  options.sys.printing.hp = {
    enable = lib.mkEnableOption "HP printing";
  };
}
