{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.office.okular;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      kdePackages.okular
    ];
  };
}
