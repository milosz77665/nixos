{
  lib,
  ...
}:
{
  options.programs.network.network-manager = {
    enable = lib.mkEnableOption "Network Manager Applet (nm-applet GUI)";
  };
}
