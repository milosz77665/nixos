{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.terminals.ghostty;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    programs.ghostty = {
      enable = true;
      settings = {
        theme = "Banana Blueberry";

        window-inherit-working-directory = true;
        window-decoration = false;
        window-padding-x = 4;
        window-padding-y = 4;
      };
    };
  };
}
