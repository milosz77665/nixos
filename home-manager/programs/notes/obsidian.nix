{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.notes.obsidian;
in
{
  options.usr.notes.obsidian = {
    enable = lib.mkEnableOption "Obsidian";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
