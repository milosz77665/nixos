{
  userConfig,
  config,
  lib,
  ...
}:
let
  cfg = config.usr.dev.git;
in
{
  options.usr.dev.git = {
    enable = lib.mkEnableOption "Git";

    config = lib.mkIf cfg.enable {
      programs.git = {
        enable = true;
        settings.user = {
          name = userConfig.git.username;
          email = userConfig.git.email;
        };
      };
    };
  };
}
