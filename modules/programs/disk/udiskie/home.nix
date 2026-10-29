{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.disk.udiskie;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    services.udiskie = {
      enable = true;
      tray = "always";
    };
  };
}
