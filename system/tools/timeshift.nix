{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.sys.tools.timeshift;
in
{
  options.sys.tools.timeshift = {
    enable = lib.mkEnableOption "Timeshift";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      timeshift
    ];
  };
}
