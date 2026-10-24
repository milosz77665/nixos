{
  lib,
  ...
}:
{
  options.programs.cli-tools.lazydocker = {
    enable = lib.mkEnableOption "lazydocker (terminal UI for Docker)";
  };
}
