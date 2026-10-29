{
  lib,
  ...
}:
{
  options.theme.fonts = {
    enable = lib.mkEnableOption "Fonts (Nerd Fonts and Noto packages with fontconfig)";
  };
}
