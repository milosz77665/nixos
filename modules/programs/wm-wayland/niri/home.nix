{
  lib,
  pkgs,
  config,
  osConfig ? {},
  isNixos,
  ...
}:
let
  cfg = osConfig.usr.wm-wayland.niri or config.usr.wm-wayland.niri;
in
{
  config = lib.mkIf cfg.enable {
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
