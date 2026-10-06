{
  lib,
  ...
}:
{
  options.sys.audio = {
    enable = lib.mkEnableOption "Audio";
  };
}
