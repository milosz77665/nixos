{ lib, ... }:
{
  options.core.display-server = lib.mkOption {
    type = lib.types.enum [ "wayland" "x11" "none" ];
    default = "none";
    description = "Display server protocol used by host (Wayland, X11, or none)";
  };

  config = {
    _module.args = {
      isWayland = config.core.display-server == "wayland";
    };
  };
}