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
      thunar
      thunar-archive-plugin
      thunar-volman
    ];
  };
}
