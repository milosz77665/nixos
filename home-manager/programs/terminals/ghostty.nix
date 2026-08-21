{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.terminals.ghostty;
in
{
  options.usr.terminals.ghostty = {
    enable = lib.mkEnableOption "Ghostty";
  };

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
