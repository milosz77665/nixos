{
  lib,
  ...
}:
{
  options.programs.communicators.discord = {
    enable = lib.mkEnableOption "Discord (voice and text chat)";
  };
}
