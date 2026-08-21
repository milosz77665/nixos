{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.notes.gnome-text-editor;
in
{
  options.usr.notes.gnome-text-editor = {
    enable = lib.mkEnableOption "Gnome Text Editor";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome-text-editor
    ];
  };
}
