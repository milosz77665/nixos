{
  vars,
  lib,
  config,
  ...
}:
let
  cfg = config.programs.dev.git;
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
