{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.programs.browsers.chrome or config.programs.browsers.chrome;
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
