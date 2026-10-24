{
  lib,
  ...
}:
{
  options.programs.cli-tools.zellij = {
    enable = lib.mkEnableOption "zellij (terminal workspace / multiplexer)";
  };
}
