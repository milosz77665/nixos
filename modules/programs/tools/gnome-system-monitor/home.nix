{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.tools.gnome-system-monitor or config.usr.tools.gnome-system-monitor;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome-system-monitor
    ];
  };
}
