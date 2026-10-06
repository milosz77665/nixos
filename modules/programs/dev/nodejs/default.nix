{
  lib,
  ...
}:
{
  options.usr.dev-languages.nodejs = {
    enable = lib.mkEnableOption "Node.js";
  };
}
