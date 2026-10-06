{
  lib,
  ...
}:
{
  options.usr.wm-wayland.fuzzel = {
    enable = lib.mkEnableOption "Fuzzel";
  };
}
