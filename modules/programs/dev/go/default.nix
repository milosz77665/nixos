{
  lib,
  ...
}:
{
  options.programs.dev.go = {
    enable = lib.mkEnableOption "Go (programming language toolchain)";
  };
}
