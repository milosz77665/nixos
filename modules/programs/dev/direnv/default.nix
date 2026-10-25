{
  lib,
  ...
}:
{
  options.programs.dev.direnv = {
    enable = lib.mkEnableOption "direnv (environment switcher with nix-direnv integration)";
  };
}
