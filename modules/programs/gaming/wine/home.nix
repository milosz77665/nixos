{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.gaming.wine or config.usr.gaming.wine;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      wine
      winetricks
    ];
  };
}
