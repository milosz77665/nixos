{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-wayland.waybar;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    assertions = [
      {
        assertion = config.core.display-server == "wayland";
        message = "programs.wm-wayland.waybar requires core.display-server = \"wayland\".";
      }
    ];

    home.packages = with pkgs; [
      blueman
      networkmanagerapplet
      pavucontrol
      swaynotificationcenter
    ];

    programs.waybar = {
      enable = true;
    };

    xdg.configFile."waybar" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
