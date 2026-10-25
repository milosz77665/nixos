{
  lib,
  pkgsUnstable,
  config,
  ...
}:
let
  cfg = config.programs.dev.nodejs;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgsUnstable; [
      nodejs_22
    ];
  };
}
