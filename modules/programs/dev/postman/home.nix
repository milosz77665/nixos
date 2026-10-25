{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.dev.postman;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      postman
    ];
  };
}
