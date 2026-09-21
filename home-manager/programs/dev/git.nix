{
  vars,
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
  };

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
