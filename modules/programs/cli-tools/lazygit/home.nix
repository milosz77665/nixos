{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.cli-tools.lazygit or config.usr.cli-tools.lazygit;
in
{
  config = lib.mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
      enableBashIntegration = true;
      shellWrapperName = "lg";
    };
  };
}
