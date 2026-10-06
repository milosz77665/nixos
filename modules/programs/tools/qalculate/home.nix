{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.tools.qalculate or config.usr.tools.qalculate;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      qalculate-gtk
    ];
  };
}
