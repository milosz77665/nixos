{
  lib,
  ...
}:
{
  options.desktop.xdg = {
    enable = lib.mkEnableOption "XDG default applications (MIME types)";
  };
}
