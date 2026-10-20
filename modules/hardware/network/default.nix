{
  lib,
  ...
}:
{
  options.hardware.network = {
    enable = lib.mkEnableOption "NetworkManager and basic networking configuration";
  };
}
