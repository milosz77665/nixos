{
  lib,
  pkgs,
  config,

  ...
}:
let
  cfg = config.programs.security.polkit-gnome;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    services.polkit-gnome.enable = true;

    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      unit = {
        description = "polkit-gnome-authentication-agent-1";
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
      };
      service = {
        type = "simple";
        execStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        restart = "on-failure";
        restartSec = 1;
        timeoutStopSec = 10;
      };
      install = {
        wantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
