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
    services.dunst = {
      enable = true;
      settings = {
        global = {
          offset = "(10,50)";
          origin = "top-right";
          transparency = 10;
          frame_color = "#eceff4";
          font = "FiraCode Nerd Font 10";
        };
      };
    };
  };
}
