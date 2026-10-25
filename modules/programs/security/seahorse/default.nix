{
  lib,
  ...
}:
{
  options.programs.security.seahorse = {
    enable = lib.mkEnableOption "Seahorse (GNOME GUI for managing encryption keys and passwords)";
  };
}
