{
  lib,
  config,
  ...
}:
let
  cfg = config.programs.communicators.discord;
in
{
  config = lib.mkIf cfg.enable {
    programs.discord.enable = true;
  };
}
