{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.notifications.dunst or config.usr.notifications.dunst;
in
{
  config = lib.mkIf cfg.enable {
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
