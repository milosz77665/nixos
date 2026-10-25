{
  lib,
  ...
}:
{
  options.programs.printing.hp = {
    enable = lib.mkEnableOption "HP Printing (CUPS service with HPLIP proprietary plugin)";
  };
}
