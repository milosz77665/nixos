{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.sys.wm-x11.betterlockscreen;
in
{
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
