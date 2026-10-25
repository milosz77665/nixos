{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.office.evince;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      evince
    ];
  };
}
