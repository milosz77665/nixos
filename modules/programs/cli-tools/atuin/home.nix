{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.cli-tools.atuin or config.usr.cli-tools.atuin;
in
{
  config = lib.mkIf cfg.enable {
    programs.atuin = {
      enable = true;
      enableBashIntegration = true;
      flags = [ "--disable-up-arrow" ];
    };
  };
}
