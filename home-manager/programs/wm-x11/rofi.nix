{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.wm-x11.rofi;
in
{
  options.usr.wm-x11.rofi = {
    enable = lib.mkEnableOption "Rofi";
  };

  config = lib.mkIf cfg.enable {
    programs.rofi.enable = true;
    xdg.configFile."rofi".source = ../../dotfiles/rofi;
  };
}
