{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-x11.xclip;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      xclip
    ];
  };
}
