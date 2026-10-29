{
  lib,
  ...
}:
{
  options.programs.wm-x11.xclip = {
    enable = lib.mkEnableOption "xclip (command-line clipboard utility for X11)";
  };
}
