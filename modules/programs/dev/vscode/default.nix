{
  lib,
  ...
}:
{
  options.usr.dev.vscode = {
    enable = lib.mkEnableOption "Visual Studio Code";
  };
}
