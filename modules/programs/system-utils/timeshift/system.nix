{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.system-utils.timeshift;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    environment.systemPackages = with pkgs; [
      timeshift
    ];
  };
}
