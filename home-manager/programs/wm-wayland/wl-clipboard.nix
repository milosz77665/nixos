{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.wm-wayland.clipboard;
in
{
  options.usr.wm-wayland.clipboard = {
    enable = lib.mkEnableOption "Clipboard";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      wl-clipboard
    ];
  };
}
