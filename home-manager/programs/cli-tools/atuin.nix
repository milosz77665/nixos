{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.cli-tools.atuin;
in
{
  options.usr.cli-tools.atuin = {
    enable = lib.mkEnableOption "Atuin";
  };

  config = lib.mkIf cfg.enable {
    programs.atuin = {
      enable = true;
      enableBashIntegration = true;
      flags = [ "--disable-up-arrow" ];
    };
  };
}
