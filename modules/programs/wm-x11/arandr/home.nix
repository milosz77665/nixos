{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-x11.arandr or config.usr.wm-x11.arandr;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      arandr
    ];
  };
}
