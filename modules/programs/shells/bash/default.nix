{
  lib,
  ...
}:
{
  options.programs.shells.bash = {
    enable = lib.mkEnableOption "Bash (GNU Bourne-Again SHell)";
  };
}
