{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.audio.pavucontrol or config.usr.audio.pavucontrol;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      pavucontrol
    ];
  };
}
