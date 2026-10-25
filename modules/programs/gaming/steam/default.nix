{
  lib,
  ...
}:
{
  options.programs.gaming.steam = {
    enable = lib.mkEnableOption "Steam";
  };
}
