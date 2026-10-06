{
  lib,
  ...
}:
{
  options.usr.cli-tools.lazydocker = {
    enable = lib.mkEnableOption "Lazydocker";
  };
}
