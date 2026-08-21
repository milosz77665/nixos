{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.file-managers.nautilus;
in
{
  options.usr.file-managers.nautilus = {
    enable = lib.mkEnableOption "Nautilus File Manager";
  };

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
