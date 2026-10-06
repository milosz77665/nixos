{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.notes.obsidian or config.usr.notes.obsidian;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
