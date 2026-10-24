{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.cli-tools.lazydocker;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      lazydocker
    ];
  };
}
