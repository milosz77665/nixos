{
  lib,
  config,
  ...
}:
let
  cfg = config.programs.gaming.lutris;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    programs.lutris.enable = true;
  };
}
