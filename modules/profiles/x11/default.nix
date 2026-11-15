{
  lib,
  config,
  ...
}:
let
  cfg = config.profiles.x11;
in
{
  options.profiles.x11 = {
    enable = lib.mkEnableOption "the X11 desktop profile with Qtile and its session add-ons";
  };

  config = lib.mkIf cfg.enable {
    core.display-server = "x11";

    programs = {
      desktop.sddm.enable = true;
      notifications.dunst.enable = true;
      tools.flameshot.enable = true;
      wm-x11.arandr.enable = true;
      wm-x11.betterlockscreen.enable = true;
      wm-x11.feh.enable = true;
      wm-x11.picom.enable = true;
      wm-x11.pywal.enable = true;
      wm-x11.qtile.enable = true;
      wm-x11.rofi.enable = true;
      wm-x11.xclip.enable = true;
    };
  };
}
