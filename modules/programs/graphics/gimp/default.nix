{
  lib,
  ...
}:
{
  options.programs.graphics.gimp = {
    enable = lib.mkEnableOption "GIMP (GNU Image Manipulation Program)";
  };
}
