{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.notifications.dunst;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    assertions = [
      {
        assertion = config.theme.fonts.enable;
        message = "programs.notifications.dunst requires theme.fonts.enable.";
      }
    ];

    services.dunst = {
      enable = true;
      settings = {
        global = {
          offset = "(10,50)";
          origin = "top-right";
          transparency = 10;
          frame_color = "#eceff4";
          font = "${config.theme.fonts.monospace.name} 10";
        };
      };
    };
  };
}
