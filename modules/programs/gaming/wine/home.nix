{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.gaming.wine;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      wine
      winetricks
    ];
  };
}
