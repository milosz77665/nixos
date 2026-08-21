{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.tools.gnome-system-monitor;
in
{
  options.usr.tools.gnome-system-monitor = {
    enable = lib.mkEnableOption "Gnome System Monitor";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome-system-monitor
    ];
  };
}
