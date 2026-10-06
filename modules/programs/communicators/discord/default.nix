{
  lib,
  ...
}:
{
  options.usr.communicators.discord = {
    enable = lib.mkEnableOption "Discord";
  };
}
