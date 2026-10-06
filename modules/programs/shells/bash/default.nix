{
  lib,
  ...
}:
{
  options.usr.shells.bash = {
    enable = lib.mkEnableOption "Bash";
  };
}
