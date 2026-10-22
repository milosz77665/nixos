{
  lib,
  ...
}:
{
  options.hardware.audio = {
    enable = lib.mkEnableOption "PipeWire audio server with ALSA and PulseAudio compatibility";
  };
}
