{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.wm-x11.arandr;
in
{
  options.usr.wm-x11.arandr = {
    enable = lib.mkEnableOption "Arandr";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      arandr
    ];
  };
}
