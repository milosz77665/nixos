{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.cli-tools.zellij or config.usr.cli-tools.zellij;
in
{
  config = lib.mkIf cfg.enable {
    programs.zellij = {
      enable = true;

      settings = {
        #   default_layout = "compact";
        pane_frames = false;
      };
    };
  };
}
