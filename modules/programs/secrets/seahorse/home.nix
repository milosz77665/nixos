{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.secrets.seahorse or config.usr.secrets.seahorse;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      seahorse
    ];
  };
}
