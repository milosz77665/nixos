{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.file-managers.thunar or config.usr.file-managers.thunar;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      xfce.thunar
      xfce.thunar-archive-plugin
      xfce.thunar-volman
    ];
  };
}
