{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.browser.chrome;
in
{
  options.usr.browser.chrome = {
    enable = lib.mkEnableOption "Google Chrome Browser";
  };

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
