{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.wm-x11.qtile;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    assertions = [
      {
        assertion = config.core.display-server == "x11";
        message = "programs.wm-x11.qtile requires core.display-server = \"x11\".";
      }
    ];

    home.packages = with pkgs; [
      alsa-utils
      brightnessctl
      iproute2
      psmisc
      xorg.xinput
    ];

    xdg.configFile."qtile" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}
