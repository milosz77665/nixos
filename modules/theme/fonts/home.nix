{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.theme.fonts;
in
{
  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      cfg.monospace.package
      nerd-fonts.fira-code
      nerd-fonts.hack
      noto-fonts
      noto-fonts-color-emoji
      liberation_ttf
    ];
  };
}
