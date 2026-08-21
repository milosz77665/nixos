{
  config,
  lib,
  pkgsUnstable,
  ...
}:
let
  cfg = config.usr.dev-languages.nodejs;
in
{
  options.usr.dev-languages.nodejs = {
    enable = lib.mkEnableOption "Node.js";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgsUnstable; [
      nodejs_22
    ];
  };
}
