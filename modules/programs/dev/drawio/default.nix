{
  lib,
  ...
}:
{
  options.programs.dev.drawio = {
    enable = lib.mkEnableOption "draw.io (desktop diagramming application)";
  };
}
