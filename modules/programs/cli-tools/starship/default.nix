{
  lib,
  ...
}:
{
  options.programs.cli-tools.starship = {
    enable = lib.mkEnableOption "Starship (cross-shell customizable prompt)";
  };
}
