{
  lib,
  pkgs,
  vars,
  isWayland,
  config,
  ...
}:
let
  cfg = config.programs.tools.flameshot;
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
        }
        // lib.optionalAttrs isWayland {
          useGrimAdapter = true;
        };
      };
    };

    home.packages = lib.mkIf isWayland [ pkgs.grim ];
  };
}