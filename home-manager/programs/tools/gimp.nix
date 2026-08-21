{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.tools.gimp;
in
{
  options.usr.tools.gimp = {
    enable = lib.mkEnableOption "Gimp";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gimp
    ];
  };
}
