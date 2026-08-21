{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.wm-wayland.fuzzel;
in
{
  options.usr.wm-wayland.fuzzel = {
    enable = lib.mkEnableOption "Fuzzel";
  };

  config = lib.mkIf cfg.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          font = "JetBrainsMono Nerd Font:size=13";
          terminal = "${pkgs.ghostty}/bin/ghostty -e";
          prompt = "❯  ";
          icon-theme = "Papirus-Dark";
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
