{
  lib,
  ...
}:
{
  options.programs.office.libreoffice = {
    enable = lib.mkEnableOption "LibreOffice (free and powerful office suite)";
  };
}
