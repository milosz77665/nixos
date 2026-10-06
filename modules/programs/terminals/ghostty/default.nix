{
  lib,
  ...
}:
{
  options.usr.terminals.ghostty = {
    enable = lib.mkEnableOption "Ghostty";
  };
}
