{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.gaming.heroic;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      heroic
    ];
  };
}
