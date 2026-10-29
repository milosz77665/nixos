{
  lib,
  ...
}:
{
  options.programs.wm-wayland.niri = {
    enable = lib.mkEnableOption "Niri (scrollable-tiling Wayland compositor)";
  };
}
