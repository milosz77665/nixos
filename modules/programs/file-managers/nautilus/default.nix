{
  lib,
  ...
}:
{
  options.programs.file-managers.nautilus = {
    enable = lib.mkEnableOption "Nautilus (GNOME default file manager)";
  };
}
