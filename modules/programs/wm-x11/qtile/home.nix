{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-x11.qtile;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [ brightnessctl ];

    xdg.configFile."qtile" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
