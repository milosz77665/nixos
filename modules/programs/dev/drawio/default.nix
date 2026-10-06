{
  lib,
  ...
}:
{
  options.usr.dev.drawio = {
    enable = lib.mkEnableOption "Drawio";
  };
}
