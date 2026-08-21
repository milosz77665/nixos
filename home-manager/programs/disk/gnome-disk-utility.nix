{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.disk.gnome-disk-utility;
in
{
  options.usr.disk.gnome-disk-utility = {
    enable = lib.mkEnableOption "Gnome Disk Utility";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome-disk-utility
    ];
  };
}
