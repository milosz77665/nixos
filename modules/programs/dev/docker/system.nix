{
  vars,
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.dev.docker;
in
{
  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      docker-compose
    ];

    users.users.${vars.user.name}.extraGroups = [ "docker" ];
  };
}
