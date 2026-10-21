{
  lib,
  ...
}:
{
  options.programs.cli-tools.atuin = {
    enable = lib.mkEnableOption "Atuin";
  };
}
