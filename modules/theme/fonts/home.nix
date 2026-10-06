{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.desktop.fonts or config.usr.desktop.fonts;
in
{
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
