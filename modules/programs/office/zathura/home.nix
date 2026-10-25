{
  lib,
  pkgs,
  config,

  ...
}:
let
  cfg = config.programs.office.zathura;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      zathura
    ];
  };
}
