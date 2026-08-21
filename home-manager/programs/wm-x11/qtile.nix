{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.wm-x11.qtile;
in
{
  options.usr.wm-x11.qtile = {
    enable = lib.mkEnableOption "Qtile";
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."qtile" = {
      source = ../../dotfiles/qtile;
      recursive = true;
    };
  };
}
