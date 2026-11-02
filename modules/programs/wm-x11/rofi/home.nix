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
    assertions = [
      {
        assertion = config.programs.wm-x11.pywal.enable;
        message = "programs.wm-x11.rofi requires programs.wm-x11.pywal.enable.";
      }
    ];

    programs.rofi.enable = true;
    xdg.configFile."rofi".source = ./dotfiles;
  };
}
