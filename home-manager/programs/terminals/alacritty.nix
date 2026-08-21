{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.terminals.alacritty;
in
{
  options.usr.terminals.alacritty = {
    enable = lib.mkEnableOption "Alacritty";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty.enable = true;
  };
}
