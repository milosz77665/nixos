{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.wm-x11.rofi or config.usr.wm-x11.rofi;
in
{
  config = lib.mkIf cfg.enable {
    programs.rofi.enable = true;
    xdg.configFile."rofi".source = ./dotfiles;
  };
}
