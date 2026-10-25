{
  lib,
  pkgsUnstable,
  config,
  ...
}:
let
  cfg = config.programs.dev.go;
in
{
  config = lib.mkIf cfg.enable {
    programs.go = {
      enable = true;
      package = pkgsUnstable.go; 
    };
  };
}