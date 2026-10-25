{
  vars,
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.dev.wireshark;
in
{
  config = lib.mkIf cfg.enable {
    programs.wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };

    users.users.${vars.user.name}.extraGroups = [ "wireshark" ];
  };
}
