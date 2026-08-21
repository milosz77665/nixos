{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.wm-wayland.swaylock;
in
{
  options.usr.wm-wayland.swaylock = {
    enable = lib.mkEnableOption "Swaylock";
  };

  config = lib.mkIf cfg.enable {
    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;

      settings = {
        indicator-idle-visible = false;
        indicator-radius = 100;
        indicator-thickness = 7;

        color = "191328";
        ring-color = "392a48";
        key-hl-color = "f6eb61";
        text-color = "cccccc";

        line-color = "00000000";
        inside-color = "191328";
        inside-clear-color = "191328";
        ring-clear-color = "22a2c9";

        inside-wrong-color = "191328";
        ring-wrong-color = "ff0000";
      };
    };
  };
}
