{
  lib,
  ...
}:
{
  options.usr.dev.git = {
    enable = lib.mkEnableOption "Git";
  };
}
