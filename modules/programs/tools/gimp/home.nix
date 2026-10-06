{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.tools.gimp or config.usr.tools.gimp;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gimp
    ];
  };
}
