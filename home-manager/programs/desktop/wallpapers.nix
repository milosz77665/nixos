{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.desktop.wallpapers;
in
{
  options.usr.desktop.wallpapers = {
    enable = lib.mkEnableOption "Wallpapers";
  };

  config = lib.mkIf cfg.enable {
    home.file."wallpapers" = {
      source = ../wallpapers;
      recursive = true;
    };
  };
}
