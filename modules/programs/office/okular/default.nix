{
  lib,
  ...
}:
{
  options.usr.tools.okular = {
    enable = lib.mkEnableOption "Okular";
  };
}
