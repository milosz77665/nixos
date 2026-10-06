{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-wayland.wdisplays or config.usr.wm-wayland.wdisplays;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      wdisplays
    ];
  };
}
