{
  lib,
  ...
}:
{
  options.programs.wm-wayland.wl-clipboard = {
    enable = lib.mkEnableOption "wl-clipboard (command-line clipboard utilities for Wayland)";
  };
}
