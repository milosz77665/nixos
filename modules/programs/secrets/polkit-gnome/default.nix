{
  lib,
  ...
}:
{
  options.usr.secrets.polkit-gnome = {
    enable = lib.mkEnableOption "Polkit Gnome";
  };
}
