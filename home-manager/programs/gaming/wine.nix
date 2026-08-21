{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.gaming.wine;
in
{
  options.usr.gaming.wine = {
    enable = lib.mkEnableOption "Wine";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      wine
      winetricks
    ];
  };
}
