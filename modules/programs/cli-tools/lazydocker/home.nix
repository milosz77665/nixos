{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.cli-tools.lazydocker or config.usr.cli-tools.lazydocker;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      lazydocker
    ];
  };
}
