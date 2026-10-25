{
  lib,
  ...
}:
{
  options.programs.dev.vscode = {
    enable = lib.mkEnableOption "Visual Studio Code";
  };
}
