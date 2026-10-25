{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.security.seahorse;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      seahorse
    ];
  };
}
