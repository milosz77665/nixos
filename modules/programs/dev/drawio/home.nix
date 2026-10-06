{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.dev.drawio or config.usr.dev.drawio;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      drawio
    ];
  };
}
