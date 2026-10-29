{
  lib,
  ...
}:
{
  options.programs.desktop.xdg = {
    enable = lib.mkEnableOption "XDG default applications (MIME types)";
  };
}
