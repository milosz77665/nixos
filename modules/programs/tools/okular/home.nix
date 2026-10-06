{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.tools.okular or config.usr.tools.okular;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      kdePackages.okular
    ];
  };
}
