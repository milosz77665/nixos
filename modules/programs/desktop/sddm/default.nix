{
  lib,
  ...
}:
{
  options.programs.desktop.sddm = {
    enable = lib.mkEnableOption "SDDM display manager (with Astronaut theme)";
  };
}
