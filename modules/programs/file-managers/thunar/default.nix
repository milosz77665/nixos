{
  lib,
  ...
}:
{
  options.programs.file-managers.thunar = {
    enable = lib.mkEnableOption "Thunar (lightweight file manager from XFCE)";
  };
}
