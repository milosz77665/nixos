{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.disk.gnome-disk-utility;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome-disk-utility
    ];
  };
}
