{
  lib,
  ...
}:
{
  options.programs.office.evince = {
    enable = lib.mkEnableOption "Evince (document viewer for PDF)";
  };
}
