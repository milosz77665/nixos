{
  config,
  lib,
  pkgs,
  userConfig,
  ...
}:
let
  cfg = config.usr.wm-wayland.flameshot;
in
{
  options.usr.wm-wayland.flameshot = {
    enable = lib.mkEnableOption "Flameshot";
  };

  config = lib.mkIf cfg.enable {
    services.flameshot = {
      enable = true;
      package = pkgs.flameshot;

      settings = {
        General = {
          disabledTrayIcon = true;
          showStartupLaunchMessage = false;
          savePath = "${userConfig.homeDirectory}/Pictures/Screenshots";
          savePathFixed = true;
          useGrimAdapter = true;
        };
      };
    };

    home.packages = with pkgs; [
      grim
    ];
  };
}
