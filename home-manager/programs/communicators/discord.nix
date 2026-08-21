{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.communicators.discord;
in
{
  options.usr.communicators.discord = {
    enable = lib.mkEnableOption "Discord";
  };

  config = lib.mkIf cfg.enable {
    programs.discord.enable = true;
  };
}
