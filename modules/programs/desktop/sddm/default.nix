{
  lib,
  ...
}:
{
  options.desktop.sddm = {
    enable = lib.mkEnableOption "SDDM display manager (with Astronaut theme)";
  };
}
