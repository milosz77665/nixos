{
  lib,
  ...
}:
{
  options.usr.notes.gnome-text-editor = {
    enable = lib.mkEnableOption "Gnome Text Editor";
  };
}
