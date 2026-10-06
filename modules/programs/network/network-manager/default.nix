{
  lib,
  ...
}:
{
  options.usr.network.network-manager = {
    enable = lib.mkEnableOption "Network Manager";
  };
}
