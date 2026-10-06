{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.cli-tools.yazi or config.usr.cli-tools.yazi;
in
{
  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
      shellWrapperName = "y";
    };
  };
}
