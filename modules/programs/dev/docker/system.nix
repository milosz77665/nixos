{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.sys.tools.docker;
in
{
  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
