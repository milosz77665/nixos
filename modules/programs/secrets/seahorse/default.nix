{
  lib,
  ...
}:
{
  options.usr.secrets.seahorse = {
    enable = lib.mkEnableOption "Seahorse";
  };
}
