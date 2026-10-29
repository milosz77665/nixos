{
  lib,
  ...
}:
{
  options.programs.wm-wayland.fuzzel = {
    enable = lib.mkEnableOption "Fuzzel (fast, Wayland-native application launcher)";
  };
}
