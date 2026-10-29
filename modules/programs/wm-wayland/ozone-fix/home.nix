{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-wayland.ozone-fix;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
