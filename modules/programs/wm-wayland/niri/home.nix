{
  lib,
  pkgs,
  config,
  osConfig ? {},
  ...
}:
let
  cfg = osConfig.usr.wm-wayland.niri or config.usr.wm-wayland.niri;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      niri
    ];

    xdg.configFile."niri" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
