{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.file-managers.nautilus or config.usr.file-managers.nautilus;
in
{
  config = lib.mkIf cfg.enable {
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
