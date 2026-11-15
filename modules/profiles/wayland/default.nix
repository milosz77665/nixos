{
  lib,
  config,
  ...
}:
let
  cfg = config.profiles.wayland;
in
{
  options.profiles.wayland = {
    enable = lib.mkEnableOption "the Wayland desktop profile with Niri and its session add-ons";
  };

  config = lib.mkIf cfg.enable {
    core.display-server = "wayland";

    programs = {
      desktop.sddm.enable = true;
      notifications.dunst.enable = true;
      tools.flameshot.enable = true;
      wm-wayland.fuzzel.enable = true;
      wm-wayland.niri.enable = true;
      wm-wayland.ozone-fix.enable = true;
      wm-wayland.swaybg.enable = true;
      wm-wayland.swaylock.enable = true;
      wm-wayland.swaync.enable = true;
      wm-wayland.waybar.enable = true;
      wm-wayland.wdisplays.enable = true;
      wm-wayland.wl-clipboard.enable = true;
    };
  };
}
