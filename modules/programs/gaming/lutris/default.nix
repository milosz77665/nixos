{
  lib,
  ...
}:
{
  options.programs.gaming.lutris = {
    enable = lib.mkEnableOption "Lutris (Universal game launcher for native, emulated, and Windows games)";
  };
}
