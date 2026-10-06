{
  lib,
  pkgsUnstable,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.dev-languages.go or config.usr.dev-languages.go;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgsUnstable; [
      go
    ];
  };
}
