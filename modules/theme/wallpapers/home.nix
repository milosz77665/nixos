{
  lib,
  config,
  ...
}:
let
  cfg = config.theme.wallpapers;
in
{
  config = lib.mkIf cfg.enable {
    home.file."wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
}
