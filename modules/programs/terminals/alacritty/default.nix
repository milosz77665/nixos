{
  lib,
  ...
}:
{
  options.programs.terminals.alacritty = {
    enable = lib.mkEnableOption "Alacritty (fast, GPU-accelerated terminal emulator)";
  };
}
