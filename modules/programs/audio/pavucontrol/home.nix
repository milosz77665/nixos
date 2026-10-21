{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.audio.pavucontrol;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      pavucontrol
    ];
  };
}
