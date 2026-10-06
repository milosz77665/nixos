{
  lib,
  ...
}:
{
  options.usr.terminals.alacritty = {
    enable = lib.mkEnableOption "Alacritty";
  };
}
