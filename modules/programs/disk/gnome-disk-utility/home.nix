{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.disk.gnome-disk-utility or config.usr.disk.gnome-disk-utility;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome-disk-utility
    ];
  };
}
