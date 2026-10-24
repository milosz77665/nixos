{
  lib,
  ...
}:
{
  options.programs.cli-tools.atuin = {
    enable = lib.mkEnableOption "atuin (magical shell history)";
  };
}
