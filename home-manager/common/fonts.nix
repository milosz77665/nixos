{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.hack
    noto-fonts
    noto-fonts-color-emoji
    liberation_ttf
  ];
}
