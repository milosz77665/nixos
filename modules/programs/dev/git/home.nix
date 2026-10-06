{
  vars,
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.dev.git or config.usr.dev.git;
in
{
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings.user = {
        name = vars.git.username;
        email = vars.git.email;
      };
    };
  };
}
