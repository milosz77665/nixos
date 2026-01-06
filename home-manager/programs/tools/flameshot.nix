{ pkgs, userConfig, ... }:
{
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot;

    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        savePath = "${userConfig.homeDirectory}/Pictures/Screenshots";
        savePathFixed = true;
      };
    };
  };
}
