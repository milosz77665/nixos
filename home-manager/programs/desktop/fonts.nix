{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.desktop.fonts;
in
{
  options.usr.desktop.fonts = {
    enable = lib.mkEnableOption "Fonts";
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.hack
      noto-fonts
      noto-fonts-color-emoji
      liberation_ttf
    ];
  };
}
