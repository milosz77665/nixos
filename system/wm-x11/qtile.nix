{
  config,
  lib,
  pkgsUnstable,
  ...
}:
let
  cfg = config.sys.wm-x11.qtile;
in
{
  options.sys.wm-wayland.qtile = {
    enable = lib.mkEnableOption "Qtile";
  };

  config = lib.mkIf cfg.enable {
    programs.gdk-pixbuf.modulePackages = [ pkgsUnstable.librsvg ];

    services.xserver = {
      enable = true;
      windowManager.qtile = {
        enable = true;
        package = pkgsUnstable.python3.pkgs.qtile;
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
  };
}
