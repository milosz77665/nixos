{
  lib,
  ...
}:
{
  options.usr.cli-tools.lazygit = {
    enable = lib.mkEnableOption "Lazygit";
  };
}
