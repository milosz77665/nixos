{
  lib,
  ...
}:
{
  options.programs.office.zathura = {
    enable = lib.mkEnableOption "Zathura (minimalist, keyboard-driven document viewer)";
  };
}
