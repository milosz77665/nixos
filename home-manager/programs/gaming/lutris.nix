{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.gaming.lutris;
in
{
  options.usr.gaming.lutris = {
    enable = lib.mkEnableOption "Lutris";
  };

  config = lib.mkIf cfg.enable {
    programs.lutris.enable = true;
  };
}
