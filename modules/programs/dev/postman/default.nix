{
  lib,
  ...
}:
{
  options.programs.dev.postman = {
    enable = lib.mkEnableOption "Postman (API development and testing tool)";
  };
}
