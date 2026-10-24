{
  lib,
  ...
}:
{
  options.programs.cli-tools.lazygit = {
    enable = lib.mkEnableOption "lazygit (terminal UI for Git)";
  };
}
