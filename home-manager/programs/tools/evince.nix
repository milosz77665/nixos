{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.tools.evince;
in
{
  options.usr.tools.evince = {
    enable = lib.mkEnableOption "Evince";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      evince
    ];
  };
}
