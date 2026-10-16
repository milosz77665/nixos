{
  lib,
  ...
}:
{
  options.usr.tools.evince = {
    enable = lib.mkEnableOption "Evince";
  };
}
