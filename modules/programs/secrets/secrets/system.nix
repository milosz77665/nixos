{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.sys.secrets;
in
{
  config = lib.mkIf cfg.enable {
    services.gnome.gnome-keyring.enable = true;

    security.polkit.enable = true;

    security.pam.services.login.enableGnomeKeyring = true;

    environment.systemPackages = [ pkgs.libsecret ];
  };
}
