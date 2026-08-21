{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.gaming.heroic;
in
{
  options.usr.gaming.heroic = {
    enable = lib.mkEnableOption "Heroic";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      heroic
    ];
  };
}
