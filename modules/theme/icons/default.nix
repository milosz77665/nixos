{
  lib,
  pkgs,
  ...
}:
{
  options.theme.icons = {
    enable = lib.mkEnableOption "Icon theme (Papirus icons)";

    name = lib.mkOption {
      type = lib.types.str;
      default = "Papirus-Dark";
      description = "Icon theme name used by theme consumers such as GTK and fuzzel.";
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.papirus-icon-theme;
      description = "Package providing the icon theme. Installed when theme.icons is enabled.";
    };
  };
}
