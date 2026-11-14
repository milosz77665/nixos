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

    environment.systemPackages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
    };
    environment.etc = anyAttrs;

    services = anyAttrs;
    security = anyAttrs;
    boot = anyAttrs;
    networking = anyAttrs;
    virtualisation = anyAttrs;
    users = anyAttrs;
    nixpkgs = anyAttrs;
    system = anyAttrs;

    hardware.bluetooth = anyAttrs;
    hardware.graphics = anyAttrs;

    programs = lib.genAttrs [
      "dconf"
      "gdk-pixbuf"
      "i3lock"
      "steam"
      "wireshark"
    ] (_: anyAttrs);
  };

  config.system.stateVersion = "25.11";
}
