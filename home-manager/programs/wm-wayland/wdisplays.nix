{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.wm-wayland.wdisplays;
in
{
  options.usr.wm-wayland.wdisplays = {
    enable = lib.mkEnableOption "Wdisplays";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      wdisplays
    ];
  };
}
