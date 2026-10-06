{
  lib,
  ...
}:
{
  options.sys.gaming.steam = {
    enable = lib.mkEnableOption "Steam";
  };
}
