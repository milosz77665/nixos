{
  lib,
  ...
}:
{
  options.usr.cli-tools.starship = {
    enable = lib.mkEnableOption "Starship";
  };
}
