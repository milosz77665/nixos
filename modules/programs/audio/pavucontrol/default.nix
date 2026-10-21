{
  lib,
  ...
}:
{
  options.programs.audio.pavucontrol = {
    enable = lib.mkEnableOption "PulseAudio Volume Control (pavucontrol)";
  };
}
