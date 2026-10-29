{
  lib,
  ...
}:
{
  options.programs.wm-wayland.ozone-fix = {
    enable = lib.mkEnableOption "Ozone Wayland backend hint for Electron/Chromium applications";
  };
}
