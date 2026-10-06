{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.tools.evince or config.usr.tools.evince;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      evince
    ];
  };
}
