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
    networking.networkmanager.enable = true;
    users.users.${vars.user.name}.extraGroups = [ "networkmanager" ];
  };
}
