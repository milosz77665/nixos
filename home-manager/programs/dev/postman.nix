{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.dev.postman;
in
{
  options.usr.dev.postman = {
    enable = lib.mkEnableOption "Postman";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      postman
    ];
  };
}
