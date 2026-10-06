{
  lib,
  pkgsUnstable,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.dev-languages.nodejs or config.usr.dev-languages.nodejs;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgsUnstable; [
      nodejs_22
    ];
  };
}
