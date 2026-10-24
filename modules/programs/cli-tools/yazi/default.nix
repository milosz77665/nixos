{
  lib,
  ...
}:
{
  options.programs.cli-tools.yazi = {
    enable = lib.mkEnableOption "yazi (blazing fast terminal file manager)";
  };
}
