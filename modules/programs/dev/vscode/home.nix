{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.dev.vscode or config.usr.dev.vscode;
in
{
  config = lib.mkIf cfg.enable {
    programs.vscode.enable = true;
  };
}
