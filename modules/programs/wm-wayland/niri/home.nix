{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-wayland.niri;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    assertions = [
      {
        assertion = config.core.display-server == "wayland";
        message = "programs.wm-wayland.niri requires core.display-server = \"wayland\".";
      }
    ];

    home.packages = with pkgs; [
      niri
      swaybg
      swaynotificationcenter
      waybar
      ghostty
      fuzzel
      brave
      gedit
      obsidian
      psmisc
      swaylock-effects
      brightnessctl
      wireplumber
      playerctl
      flameshot
    ];

    xdg.configFile."niri" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
