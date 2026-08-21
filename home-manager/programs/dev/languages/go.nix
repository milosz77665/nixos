{
  config,
  lib,
  pkgsUnstable,
  ...
}:
let
  cfg = config.usr.dev-languages.go;
in
{
  options.usr.dev-languages.go = {
    enable = lib.mkEnableOption "Go";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgsUnstable; [
      go
    ];
  };
}
