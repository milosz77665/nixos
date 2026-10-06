{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.gaming.heroic or config.usr.gaming.heroic;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      heroic
    ];
  };
}
