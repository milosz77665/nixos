{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.theme.gtk;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    assertions = [
      {
        assertion = config.theme.fonts.enable;
        message = "theme.gtk requires theme.fonts.enable.";
      }
      {
        assertion = config.theme.icons.enable;
        message = "theme.gtk requires theme.icons.enable.";
      }
    ];

    gtk = {
      enable = true;

      colorScheme = "dark";

      theme = {
        name = "Dracula";
        package = pkgs.dracula-theme;
      };

      iconTheme = {
        name = config.theme.icons.name;
        package = config.theme.icons.package;
      };

      font = {
        name = config.theme.fonts.monospace.name;
        size = 11;
        package = config.theme.fonts.monospace.package;
      };
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
