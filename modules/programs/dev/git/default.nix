{
  lib,
  ...
}:
{
  options.programs.dev.git = {
    enable = lib.mkEnableOption "Git (version control system)";
  };
}
