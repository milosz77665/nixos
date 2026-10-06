{
  lib,
  ...
}:
{
  options.sys.display-managers.sddm = {
    enable = lib.mkEnableOption "SDDM";
  };
}
