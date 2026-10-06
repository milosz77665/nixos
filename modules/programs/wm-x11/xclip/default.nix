{
  lib,
  ...
}:
{
  options.usr.wm-x11.xclip = {
    enable = lib.mkEnableOption "Clipboard";
  };
}
