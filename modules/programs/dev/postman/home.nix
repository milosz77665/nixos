{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.dev.postman or config.usr.dev.postman;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      postman
    ];
  };
}
