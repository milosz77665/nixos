{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.sys.printing.hp;
in
{
  config = lib.mkIf cfg.enable {
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
