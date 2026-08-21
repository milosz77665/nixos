{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.tools.libreoffice;
in
{
  options.usr.tools.libreoffice = {
    enable = lib.mkEnableOption "Libreoffice";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}
