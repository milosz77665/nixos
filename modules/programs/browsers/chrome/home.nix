{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.browser.chrome or config.usr.browser.chrome;
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
