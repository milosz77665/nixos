{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.sys.secrets;
in
{
  options.sys.secrets = {
    enable = lib.mkEnableOption "Secrets";
  };

  config = lib.mkIf cfg.enable {
    services.gnome.gnome-keyring.enable = true;

    security.polkit.enable = true;

    security.pam.services.login.enableGnomeKeyring = true;

    environment.systemPackages = [ pkgs.libsecret ];
  };
}
