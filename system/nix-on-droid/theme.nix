{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.nix-on-droid.theme;
in
{
  options.usr.nix-on-droid.theme = {
    enable = lib.mkEnableOption "Theme for nix-on-droid";
  };

  config = lib.mkIf cfg.enable {
    terminal = {
      font = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFont-Regular.ttf";

      colors = {
        background = "#191328";
        foreground = "#cccccc";
        cursor = "#f6eb61";

        color0 = "#191328";
        color1 = "#e05561";
        color2 = "#42a36b";
        color3 = "#f6eb61";
        color4 = "#22a2c9";
        color5 = "#8f5da8";
        color6 = "#22a2c9";
        color7 = "#cccccc";

        color8 = "#392a48";
        color9 = "#ff6e7a";
        color10 = "#5cdb87";
        color11 = "#fffa8c";
        color12 = "#4bbedb";
        color13 = "#b48ac9";
        color14 = "#4bbedb";
        color15 = "#ffffff";
      };
    };
  };
}
