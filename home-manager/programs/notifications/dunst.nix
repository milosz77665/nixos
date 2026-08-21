{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.notifications.dunst;
in
{
  options.usr.notifications.dunst = {
    enable = lib.mkEnableOption "Dunst";
  };

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
