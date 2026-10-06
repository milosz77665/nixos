{
  lib,
  ...
}:
{
  options.usr.cli-tools.atuin = {
    enable = lib.mkEnableOption "Atuin";
  };
}
