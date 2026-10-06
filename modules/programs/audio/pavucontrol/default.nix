{
  lib,
  ...
}:
{
  options.usr.audio.pavucontrol = {
    enable = lib.mkEnableOption "PulseAudio Volume Control (pavucontrol)";
  };
}
