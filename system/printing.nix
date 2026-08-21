{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.sys.printing.hp;
in
{
  options.sys.printing.hp = {
    enable = lib.mkEnableOption "HP printing";
  };

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

