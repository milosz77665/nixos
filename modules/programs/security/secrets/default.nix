{
  lib,
  ...
}:
{
  options.programs.security.secrets = {
    enable = lib.mkEnableOption "Secret management backend (GNOME Keyring, PAM integration, Polkit)";
  };
}
