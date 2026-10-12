{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.media.imv or config.usr.media.imv;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ imv ];
  };
}

