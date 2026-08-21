{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.tools.okular;
in
{
  options.usr.tools.okular = {
    enable = lib.mkEnableOption "Okular";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      kdePackages.okular
    ];
  };
}
