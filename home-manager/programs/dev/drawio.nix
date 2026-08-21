{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.dev.drawio;
in
{
  options.usr.dev.drawio = {
    enable = lib.mkEnableOption "Drawio";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      drawio
    ];
  };
}
