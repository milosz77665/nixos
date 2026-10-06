{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.desktop.wallpapers or config.usr.desktop.wallpapers;
in
{
  config = lib.mkIf cfg.enable {
    home.file."wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
}
