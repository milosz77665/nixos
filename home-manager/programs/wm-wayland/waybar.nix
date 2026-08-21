{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.wm-wayland.waybar;
in
{
  options.usr.wm-wayland.waybar = {
    enable = lib.mkEnableOption "Waybar";
  };

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
    };

    xdg.configFile."waybar" = {
      source = ../../dotfiles/waybar;
      recursive = true;
    };
  };
}
