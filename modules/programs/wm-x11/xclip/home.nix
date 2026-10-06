{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-x11.xclip or config.usr.wm-x11.xclip;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      xclip
    ];
  };
}
