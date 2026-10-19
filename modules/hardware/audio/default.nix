{
  lib,
  ...
}:
{
  options.sys.audio = {
    enable = lib.mkEnableOption "PipeWire audio server with ALSA and PulseAudio compatibility";
  };
}
