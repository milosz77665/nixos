{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.cli-tools.lazydocker;
in
{
  options.usr.cli-tools.lazydocker = {
    enable = lib.mkEnableOption "Lazydocker";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      lazydocker
    ];
  };
}
