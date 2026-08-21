{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.cli-tools.yazi;
in
{
  options.usr.cli-tools.yazi = {
    enable = lib.mkEnableOption "Yazi";
  };

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
      shellWrapperName = "y";
    };
  };
}
