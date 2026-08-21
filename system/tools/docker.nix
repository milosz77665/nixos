{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.sys.tools.docker;
in
{
  options.sys.tools.docker = {
    enable = lib.mkEnableOption "Docker";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
