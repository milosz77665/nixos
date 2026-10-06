{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.browser.brave or config.usr.browser.brave;
in
{
  config = lib.mkIf cfg.enable {
    programs.brave = {
      enable = true;
      commandLineArgs = [
        "--force-dark-mode"
        "--restore-last-session"
      ];
    };
  };
}
