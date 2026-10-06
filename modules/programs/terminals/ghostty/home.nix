{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.terminals.ghostty or config.usr.terminals.ghostty;
in
{
  config = lib.mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      settings = {
        theme = "Banana Blueberry";

        window-inherit-working-directory = true;
        window-decoration = false;
        window-padding-x = 4;
        window-padding-y = 4;
      };
    };
  };
}
