{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.theme.icons;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = [ cfg.package ];
  };
}
