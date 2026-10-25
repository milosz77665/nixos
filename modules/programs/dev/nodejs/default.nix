{
  lib,
  ...
}:
{
  options.programs.dev.nodejs = {
    enable = lib.mkEnableOption "Node.js (JavaScript runtime environment)";
  };
}
