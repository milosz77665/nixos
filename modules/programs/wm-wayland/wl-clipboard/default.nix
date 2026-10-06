{
  lib,
  ...
}:
{
  options.usr.wm-wayland.clipboard = {
    enable = lib.mkEnableOption "Clipboard";
  };
}
