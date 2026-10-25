{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.dev.drawio;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      drawio
    ];
  };
}
