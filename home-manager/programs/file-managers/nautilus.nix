{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nautilus
  ];

  dconf.settings = {
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      search-filter-time-type = "last_modified";
    };
  };
}
