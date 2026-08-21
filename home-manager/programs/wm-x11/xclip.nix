{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.wm-x11.xclip;
in
{
  options.usr.wm-x11.xclip = {
    enable = lib.mkEnableOption "Clipboard";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      xclip
    ];
  };
}
