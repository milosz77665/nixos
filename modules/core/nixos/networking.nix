{ lib, hostName, ... }:
{
  networking.hostName = lib.mkDefault hostName;
}
