{ lib }:
{ ... }:
let
  anyAttrs = lib.mkOption {
    type = lib.types.attrsOf lib.types.anything;
    default = { };
  };
in
{
  options = {
    assertions = lib.mkOption {
      type = lib.types.listOf lib.types.anything;
      default = [ ];
    };

    core.display-server = lib.mkOption {
      type = lib.types.enum [
        "wayland"
        "x11"
        "none"
      ];
      default = "none";
    };

    terminal = anyAttrs;
    home-manager = anyAttrs;
  };
}
