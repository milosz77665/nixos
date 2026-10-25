{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.file-managers.nemo;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
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
