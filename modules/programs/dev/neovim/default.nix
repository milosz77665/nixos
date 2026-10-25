{
  lib,
  ...
}:
{
  options.programs.dev.neovim = {
    enable = lib.mkEnableOption "Neovim (text editor with IDE dependencies: LSPs, formatters)";
  };
}
