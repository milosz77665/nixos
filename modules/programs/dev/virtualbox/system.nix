{
  vars,
  lib,
  config,
  ...
}:
let
  cfg = config.programs.dev.virtualbox;
in
{
  config = lib.mkIf cfg.enable {
    virtualisation.virtualbox.host.enable = true;

    users.users.${vars.user.name}.extraGroups = [ "vboxusers" ];
  };
}
