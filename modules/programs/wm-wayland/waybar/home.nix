{
  lib,
  config,
  osConfig,
  ...
}:
let
  cfg = osConfig.usr.wm-wayland.waybar or config.usr.wm-wayland.waybar;
in
{
  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
    };

    xdg.configFile."waybar" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
