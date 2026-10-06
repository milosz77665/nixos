{
  lib,
  pkgs,
  vars,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-x11.flameshot or config.usr.wm-x11.flameshot;
in
{
  config = lib.mkIf cfg.enable {
    services.flameshot = {
      enable = true;
      package = pkgs.flameshot;

      settings = {
        General = {
          disabledTrayIcon = true;
          showStartupLaunchMessage = false;
          savePath = "${vars.homeDirectory}/Pictures/Screenshots";
          savePathFixed = true;
        };
      };
    };
  };
}
