{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.network.network-manager;
in
{
  options.usr.network.network-manager = {
    enable = lib.mkEnableOption "Network Manager";
  };

  config = lib.mkIf cfg.enable {
    services.network-manager-applet.enable = true;

    home.packages = with pkgs; [
      networkmanagerapplet
    ];
  };
}
