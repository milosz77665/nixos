{
  lib,
  ...
}:
{
  options.theme.gtk = {
    enable = lib.mkEnableOption "GTK (Dracula theme, configurable icons and monospace font, Bibata cursors)";
  };
}
