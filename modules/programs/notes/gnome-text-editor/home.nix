{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.notes.gnome-text-editor or config.usr.notes.gnome-text-editor;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome-text-editor
    ];
  };
}
