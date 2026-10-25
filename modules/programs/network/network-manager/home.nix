{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.network.network-manager;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    services.network-manager-applet.enable = true;
  };
}
