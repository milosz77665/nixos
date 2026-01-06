{ userConfig, ... }:
{
  services.xserver = {
    enable = true;
    windowManager.qtile = {
      enable = true;
      extraPackages =
        python3Packages: with python3Packages; [
          qtile-extras
          psutil
          pywal
          xcffib
          dbus-fast
        ];
    };
  };
}
