{
  lib,
  ...
}:
{
  options.programs.dev.docker = {
    enable = lib.mkEnableOption "Docker (containerization platform and daemon)";
  };
}
