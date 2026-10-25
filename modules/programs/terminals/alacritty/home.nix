{
  lib,
  config,
  ...
}:
let
  cfg = config.programs.terminals.alacritty;
in
{
  config = lib.mkIf cfg.enable {
    programs.alacritty.enable = true;
  };
}
