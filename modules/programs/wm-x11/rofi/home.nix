{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-x11.rofi;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    programs.rofi.enable = true;
    xdg.configFile."rofi".source = ./dotfiles;
  };
}
