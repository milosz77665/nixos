{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-wayland.waybar;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    programs.waybar = {
      enable = true;
    };

    xdg.configFile."waybar" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
