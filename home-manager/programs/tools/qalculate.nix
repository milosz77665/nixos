{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.tools.qalculate;
in
{
  options.usr.tools.qalculate = {
    enable = lib.mkEnableOption "Qalculate";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      qalculate-gtk
    ];
  };
}
