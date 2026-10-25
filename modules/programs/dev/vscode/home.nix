{
  lib,
  config,
  ...
}:
let
  cfg = config.programs.dev.vscode;
in
{
  config = lib.mkIf cfg.enable {
    programs.vscode.enable = true;
  };
}
