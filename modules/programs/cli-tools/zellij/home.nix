{
  lib,
  config,
  ...
}:
let
  cfg = config.programs.cli-tools.zellij;
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
