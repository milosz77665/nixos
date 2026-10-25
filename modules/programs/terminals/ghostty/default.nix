{
  lib,
  ...
}:
{
  options.programs.terminals.ghostty = {
    enable = lib.mkEnableOption "Ghostty (fast, feature-rich, GPU-accelerated terminal)";
  };
}
