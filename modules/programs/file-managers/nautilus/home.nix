{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.file-managers.nautilus;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      nautilus
    ];

    dconf.settings = {
      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
        search-filter-time-type = "last_modified";
      };
    };
  };
}
