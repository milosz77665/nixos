{
  lib,
  ...
}:
{
  options.usr.notifications.dunst = {
    enable = lib.mkEnableOption "Dunst";
  };
}
