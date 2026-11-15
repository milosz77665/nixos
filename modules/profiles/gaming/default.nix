{
  lib,
  config,
  ...
}:
let
  cfg = config.profiles.gaming;
in
{
  options.profiles.gaming = {
    enable = lib.mkEnableOption "the gaming profile with game launchers and compatibility tools";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      gaming.heroic.enable = true;
      gaming.lutris.enable = true;
      gaming.steam.enable = true;
      gaming.wine.enable = true;
    };
  };
}
