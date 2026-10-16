{
  lib,
  ...
}:
{
  options.usr.tools.libreoffice = {
    enable = lib.mkEnableOption "Libreoffice";
  };
}
