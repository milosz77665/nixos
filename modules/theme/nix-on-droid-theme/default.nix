{
  lib,
  ...
}:
{
  options.theme.nix-on-droid-theme = {
    enable = lib.mkEnableOption "Nix-on-Droid theme (JetBrains Mono font and custom terminal colors)";
  };
}
