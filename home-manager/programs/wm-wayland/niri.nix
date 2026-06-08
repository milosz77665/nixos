{ pkgs, ... }:
{
  home.packages = with pkgs; [
    niri
  ];

  xdg.configFile."niri" = {
    source = ../../dotfiles/niri;
    recursive = true;
  };
}
