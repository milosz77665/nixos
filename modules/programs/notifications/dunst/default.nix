{
  lib,
  ...
}:
{
  options.programs.notifications.dunst = {
    enable = lib.mkEnableOption "Dunst (lightweight and customizable notification daemon)";
  };
}
