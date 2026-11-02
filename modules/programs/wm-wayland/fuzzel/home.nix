{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-wayland.fuzzel;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    assertions = [
      {
        assertion = config.core.display-server == "wayland";
        message = "programs.wm-wayland.fuzzel requires core.display-server = \"wayland\".";
      }
      {
        assertion = config.theme.fonts.enable;
        message = "programs.wm-wayland.fuzzel requires theme.fonts.enable.";
      }
      {
        assertion = config.theme.icons.enable;
        message = "programs.wm-wayland.fuzzel requires theme.icons.enable.";
      }
    ];

    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          font = "${config.theme.fonts.monospace.name}:size=13";
          terminal = "${pkgs.ghostty}/bin/ghostty -e";
          prompt = "❯  ";
          icon-theme = config.theme.icons.name;
          layer = "overlay";
          lines = 10;
          width = 40;
          horizontal-pad = 20;
          vertical-pad = 20;
          inner-pad = 10;
        };
        colors = {
          background = "191328ff";
          text = "ccccccff";
          match = "f6eb61ff";
          selection = "392a48ff";
          selection-text = "ffffffff";
          selection-match = "f6eb61ff";
          border = "22a2c9ff";
        };
        border = {
          width = 2;
          radius = 12;
        };
      };
    };
  };
}
