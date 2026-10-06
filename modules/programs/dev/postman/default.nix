{
  lib,
  ...
}:
{
  options.usr.dev.postman = {
    enable = lib.mkEnableOption "Postman";
  };
}
