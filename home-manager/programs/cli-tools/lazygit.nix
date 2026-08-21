{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.cli-tools.lazygit;
in
{
  options.usr.cli-tools.lazygit = {
    enable = lib.mkEnableOption "Lazygit";
  };

  config = lib.mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
      enableBashIntegration = true;
      shellWrapperName = "lg";
    };
  };
}

