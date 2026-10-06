{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.tools.libreoffice or config.usr.tools.libreoffice;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}
