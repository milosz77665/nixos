{
  lib,
  pkgs,
  ...
}:
{
  options.theme.fonts = {
    enable = lib.mkEnableOption "Fonts (configurable monospace font, Nerd Fonts and Noto packages with fontconfig)";

    monospace = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "JetBrainsMono Nerd Font";
        description = "Font family name used by theme consumers as the monospace font.";
      };

      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.nerd-fonts.jetbrains-mono;
        description = "Package providing the monospace font. Installed when theme.fonts is enabled.";
      };

      file = lib.mkOption {
        type = lib.types.path;
        default = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFont-Regular.ttf";
        description = "Path to the regular monospace font file for consumers that require a file path (e.g. nix-on-droid terminal). Keep it consistent with package when overriding.";
      };
    };
  };
}
