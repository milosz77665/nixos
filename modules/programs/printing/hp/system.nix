{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.printing.hp;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    environment.systemPackages = with pkgs; [
      system-config-printer
      hplipWithPlugin
    ];

    services.printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };
  };
}
