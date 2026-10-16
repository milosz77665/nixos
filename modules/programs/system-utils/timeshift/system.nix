{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.sys.tools.timeshift;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      timeshift
    ];
  };
}
