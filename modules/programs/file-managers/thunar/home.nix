{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.file-managers.thunar;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      xfce.thunar
      xfce.thunar-archive-plugin
      xfce.thunar-volman
    ];
  };
}
