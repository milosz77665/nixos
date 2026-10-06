{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.tools.zathura or config.usr.tools.zathura;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      zathura
    ];
  };
}
