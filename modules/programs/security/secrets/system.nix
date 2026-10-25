{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.security.secrets;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    services.gnome.gnome-keyring.enable = true;

    security.polkit.enable = true;

    security.pam.services.login.enableGnomeKeyring = true;

    environment.systemPackages = [ pkgs.libsecret ];
  };
}
