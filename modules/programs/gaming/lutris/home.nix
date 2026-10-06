{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.gaming.lutris or config.usr.gaming.lutris;
in
{
  config = lib.mkIf cfg.enable {
    programs.lutris.enable = true;
  };
}
