{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.graphics.gimp;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gimp
    ];
  };
}
