{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.dev.vscode;
in
{
  options.usr.dev.vscode = {
    enable = lib.mkEnableOption "Visual Studio Code";
  };

  config = lib.mkIf cfg.enable {
    programs.vscode.enable = true;
  };
}
