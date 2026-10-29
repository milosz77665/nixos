{
  lib,
  pkgs,
  config,
  isNixos,
  ...
}:
let
  cfg = config.programs.wm-wayland.niri;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = lib.mkIf isNixos (with pkgs; [
      niri
      brightnessctl
    ]);

    xdg.configFile."niri" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
