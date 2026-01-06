{ pkgs, ... }:
{
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
}
