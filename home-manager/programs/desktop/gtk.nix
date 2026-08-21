{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.gtk;
in
{
  options.usr.gtk = {
    enable = lib.mkEnableOption "GTK";
  };

  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;

      colorScheme = "dark";

      theme = {
        name = "Dracula";
        package = pkgs.dracula-theme;
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

      font = {
        name = "JetBrainsMono Nerd Font";
        size = 11;
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      cursorTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
      };
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
