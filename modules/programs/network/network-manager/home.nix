{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.network.network-manager or config.usr.network.network-manager;
in
{
  config = lib.mkIf cfg.enable {
    services.network-manager-applet.enable = true;

    home.packages = with pkgs; [
      networkmanagerapplet
    ];
  };
}
