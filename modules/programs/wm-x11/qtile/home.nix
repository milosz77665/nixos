{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-x11.qtile or config.usr.wm-x11.qtile;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ brightnessctl ];

    xdg.configFile."qtile" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
