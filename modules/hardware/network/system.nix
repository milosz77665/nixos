{
  vars,
  lib,
  config,
  ...
}:
let
  cfg = config.hardware.network;
in
{
  config = lib.mkIf cfg.enable {
    networking.hostName = lib.mkIf (vars ? hostName) vars.hostName;

    networking.networkmanager.enable = true;
    users.users.${vars.user.name}.extraGroups = [ "networkmanager" ];
  };
}
