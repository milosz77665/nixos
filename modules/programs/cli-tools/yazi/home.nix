{
  lib,
  config,
  ...
}:
let
  cfg = config.programs.cli-tools.yazi;
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
