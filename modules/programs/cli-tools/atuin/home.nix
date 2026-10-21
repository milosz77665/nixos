{
  lib,
  config,
  ...
}:
let
  cfg = config.programs.cli-tools.atuin;
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
