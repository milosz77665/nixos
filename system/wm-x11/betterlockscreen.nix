{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.sys.wm-x11.betterlockscreen;
in
{
  options.sys.wm-x11.betterlockscreen = {
    enable = lib.mkEnableOption "Betterlockscreen";
  };

  config = lib.mkIf cfg.enable {
    programs.i3lock = {
      enable = true;
      package = pkgs.i3lock-color;
    };

    environment.systemPackages = [
      pkgs.betterlockscreen
    ];
  };
}
