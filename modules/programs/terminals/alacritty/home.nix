{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.terminals.alacritty or config.usr.terminals.alacritty;
in
{
  config = lib.mkIf cfg.enable {
    programs.alacritty.enable = true;
  };
}
