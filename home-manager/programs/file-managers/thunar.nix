{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.file-managers.thunar;
in
{
  options.usr.file-managers.thunar = {
    enable = lib.mkEnableOption "Thunar File Manager";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      xfce.thunar
      xfce.thunar-archive-plugin
      xfce.thunar-volman
    ];
  };
}
