{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-wayland.clipboard or config.usr.wm-wayland.clipboard;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      wl-clipboard
    ];
  };
}
