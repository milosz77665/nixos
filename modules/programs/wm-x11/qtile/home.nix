{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-x11.qtile or config.usr.wm-x11.qtile;
in
{
  config = lib.mkIf cfg.enable {
    xdg.configFile."qtile" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
