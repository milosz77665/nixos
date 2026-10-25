{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.network.qbittorrent;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      qbittorrent
    ];
  };
}
