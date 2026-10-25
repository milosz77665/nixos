{
  lib,
  ...
}:
{
  options.programs.office.okular = {
    enable = lib.mkEnableOption "Okular (universal document viewer by KDE)";
  };
}
