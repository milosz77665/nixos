{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.disk.baobab;
in
{
  options.usr.disk.baobab = {
    enable = lib.mkEnableOption "Baobab";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      baobab
    ];
  };
}
