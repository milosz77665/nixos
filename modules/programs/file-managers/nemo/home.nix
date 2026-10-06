{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.file-managers.nemo or config.usr.file-managers.nemo;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nemo-with-extensions
    ];

    dconf.settings = {
      "org/nemo/preferences" = {
        show-hidden-files = true;
        default-folder-viewer = "list-view";
        show-compact-view-icon-toolbar = false;
      };
    };
  };
}
