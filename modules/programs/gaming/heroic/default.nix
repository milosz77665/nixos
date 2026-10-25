{
  lib,
  ...
}:
{
  options.programs.gaming.heroic = {
    enable = lib.mkEnableOption "Heroic Games Launcher (Epic, GOG, and Amazon Games)";
  };
}
