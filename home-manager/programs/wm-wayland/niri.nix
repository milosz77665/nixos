{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.wm-wayland.niri;
in
{
  options.usr.wm-wayland.niri = {
    enable = lib.mkEnableOption "Niri";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      niri
    ];

    xdg.configFile."niri" = {
      source = ../../dotfiles/niri;
      recursive = true;
    };
  };
}
