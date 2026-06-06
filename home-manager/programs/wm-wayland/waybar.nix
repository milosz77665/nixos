{
  programs.waybar = {
    enable = true;
  };

  xdg.configFile."waybar" = {
    source = ../../dotfiles/waybar;
    recursive = true;
  };
}
