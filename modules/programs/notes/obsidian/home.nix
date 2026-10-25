{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.notes.obsidian;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
