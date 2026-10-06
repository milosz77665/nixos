{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.communicators.discord or config.usr.communicators.discord;
in
{
  config = lib.mkIf cfg.enable {
    programs.discord.enable = true;
  };
}
