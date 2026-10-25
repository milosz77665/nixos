{
  lib,
  ...
}:
{
  options.programs.disk.udiskie = {
    enable = lib.mkEnableOption "udiskie (automounter for removable media)";
  };
}
