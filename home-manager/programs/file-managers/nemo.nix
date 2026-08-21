{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.file-managers.nemo;
in
{
  options.usr.file-managers.nemo = {
    enable = lib.mkEnableOption "Nemo File Manager";
  };

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
