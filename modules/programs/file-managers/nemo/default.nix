{
  lib,
  ...
}:
{
  options.usr.file-managers.nemo = {
    enable = lib.mkEnableOption "Nemo File Manager";
  };
}
