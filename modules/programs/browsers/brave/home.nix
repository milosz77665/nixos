{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.programs.browsers.brave or config.programs.browsers.brave;
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
