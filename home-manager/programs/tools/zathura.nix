{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.tools.zathura;
in
{
  options.usr.tools.zathura = {
    enable = lib.mkEnableOption "Zathura";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      zathura
    ];
  };
}
