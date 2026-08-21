{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.browser.brave;
in
{
  options.usr.browser.brave = {
    enable = lib.mkEnableOption "Brave Browser";
  };

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
