{
  lib,
  ...
}:
{
  options.usr.gtk = {
    enable = lib.mkEnableOption "GTK";
  };
}
