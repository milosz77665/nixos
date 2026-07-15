{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.usr.audio.pavucontrol;
in
{
  options.usr.audio.pavucontrol = {
    enable = lib.mkEnableOption "PulseAudio Volume Control (pavucontrol)";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      pavucontrol
    ];
  };
}
