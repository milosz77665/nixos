{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.media.imv;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [ imv ];
  };
}

