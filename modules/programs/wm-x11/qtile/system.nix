{
  lib,
  pkgsUnstable,
  config,
  ...
}:
let
  cfg = config.usr.wm-x11.qtile;
in
{
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
