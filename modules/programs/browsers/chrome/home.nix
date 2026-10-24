{
  lib,
  config,
  ...
}:
let
  cfg = config.programs.browsers.chrome;
in
{
  config = lib.mkIf cfg.enable {
    programs.google-chrome = {
      enable = true;
      commandLineArgs = [
        "--force-dark-mode"
        "--restore-last-session"
      ];
    };
  };
}
