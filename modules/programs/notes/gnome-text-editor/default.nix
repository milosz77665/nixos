{
  lib,
  ...
}:
{
  options.programs.notes.gnome-text-editor = {
    enable = lib.mkEnableOption "GNOME Text Editor";
  };
}
