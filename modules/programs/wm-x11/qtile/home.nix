{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-x11.qtile;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      acpi
      alacritty
      alsa-utils
      arandr
      baobab
      betterlockscreen
      blueman
      bluez
      brave
      brightnessctl
      dunst
      feh
      flameshot
      gnome-text-editor
      networkmanager
      networkmanagerapplet
      obsidian
      picom
      psmisc
      pywal
      rofi
      swaybg
      vscode
      xorg.xinput
    ];

    xdg.configFile."qtile" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
