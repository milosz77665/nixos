{
  lib,
  ...
}:
{
  options.theme.nix-on-droid-theme = {
    enable = lib.mkEnableOption "Nix-on-Droid theme (shared monospace font and custom terminal colors)";
  };
}
