{
  lib,
  ...
}:
{
  options.usr.dev-languages.go = {
    enable = lib.mkEnableOption "Go";
  };
}
