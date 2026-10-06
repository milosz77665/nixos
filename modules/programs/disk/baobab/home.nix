{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.disk.baobab or config.usr.disk.baobab;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      baobab
    ];
  };
}
