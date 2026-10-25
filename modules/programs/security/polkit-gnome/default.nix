{
  lib,
  ...
}:
{
  options.programs.security.polkit-gnome = {
    enable = lib.mkEnableOption "Polkit GNOME (authentication agent for GUI root prompts)";
  };
}
