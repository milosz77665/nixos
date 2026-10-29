{
  lib,
  ...
}:
{
  options.theme.gtk = {
    enable = lib.mkEnableOption "GTK (Dracula theme, Papirus icons, Bibata cursors and JetBrains Mono font)";
  };
}
