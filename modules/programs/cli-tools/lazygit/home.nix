{
  lib,
  config,
  ...
}:
let
  cfg = config.programs.cli-tools.lazygit;
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
