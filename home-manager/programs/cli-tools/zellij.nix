{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.cli-tools.zellij;
in
{
  options.usr.cli-tools.zellij = {
    enable = lib.mkEnableOption "Zellij";
  };

  config = lib.mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      enableBashIntegration = true;

      settings = {
        #   default_layout = "compact";
        pane_frames = false;
      };
    };
  };
}
