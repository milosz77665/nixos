{
  lib,
  pkgs,
  ...
}:
{
  options.theme.cursors = {
    enable = lib.mkEnableOption "Cursor theme (Bibata cursors with X11 and GTK integration)";

    name = lib.mkOption {
      type = lib.types.str;
      default = "Bibata-Modern-Ice";
      description = "Cursor theme name used by X11, Wayland and GTK.";
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.bibata-cursors;
      description = "Package providing the cursor theme.";
    };

    size = lib.mkOption {
      type = lib.types.int;
      default = 24;
      description = "Cursor size in pixels.";
    };
  };
}
