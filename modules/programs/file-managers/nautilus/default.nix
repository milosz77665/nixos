{
  lib,
  ...
}:
{
  options.usr.file-managers.nautilus = {
    enable = lib.mkEnableOption "Nautilus File Manager";
  };
}
