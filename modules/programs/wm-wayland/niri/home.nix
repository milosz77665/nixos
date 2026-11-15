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

    home.packages =
      (with pkgs; [
        niri
        gedit
        psmisc
        brightnessctl
        wireplumber
        playerctl
      ])
      ++ lib.optionals (!config.programs.wm-wayland.fuzzel.enable) (with pkgs; [ fuzzel ])
      ++ lib.optionals (!config.programs.wm-wayland.swaybg.enable) (with pkgs; [ swaybg ])
      ++ lib.optionals (!config.programs.wm-wayland.swaync.enable) (with pkgs; [ swaynotificationcenter ])
      ++ lib.optionals (!config.programs.wm-wayland.waybar.enable) (with pkgs; [ waybar ])
      ++ lib.optionals (!config.programs.terminals.ghostty.enable) (with pkgs; [ ghostty ])
      ++ lib.optionals (!config.programs.browsers.brave.enable) (with pkgs; [ brave ])
      ++ lib.optionals (!config.programs.notes.obsidian.enable) (with pkgs; [ obsidian ])
      ++ lib.optionals (!config.programs.wm-wayland.swaylock.enable) (with pkgs; [ swaylock-effects ])
      ++ lib.optionals (!config.programs.tools.flameshot.enable) (with pkgs; [ flameshot ]);

    xdg.configFile."niri" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
