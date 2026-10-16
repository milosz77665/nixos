{
  lib,
  ...
}:
{
  options.programs.tools.flameshot = {
    enable = lib.mkEnableOption "Flameshot screenshot tool";
  };
}
